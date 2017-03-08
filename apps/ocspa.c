/* ocsp.c */
/* Written by Dr Stephen N Henson (steve@openssl.org) for the OpenSSL
 * project 2000.
 */
/* ====================================================================
 * Copyright (c) 1999 The OpenSSL Project.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer. 
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgment:
 *    "This product includes software developed by the OpenSSL Project
 *    for use in the OpenSSL Toolkit. (http://www.OpenSSL.org/)"
 *
 * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please contact
 *    licensing@OpenSSL.org.
 *
 * 5. Products derived from this software may not be called "OpenSSL"
 *    nor may "OpenSSL" appear in their names without prior written
 *    permission of the OpenSSL Project.
 *
 * 6. Redistributions of any form whatsoever must retain the following
 *    acknowledgment:
 *    "This product includes software developed by the OpenSSL Project
 *    for use in the OpenSSL Toolkit (http://www.OpenSSL.org/)"
 *
 * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
 * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 * ====================================================================
 *
 * This product includes cryptographic software written by Eric Young
 * (eay@cryptsoft.com).  This product includes software written by Tim
 * Hudson (tjh@cryptsoft.com).
 *
 */
#ifndef OPENSSL_NO_OCSP

#ifdef OPENSSL_SYS_VMS
#define _XOPEN_SOURCE_EXTENDED	/* So fd_set and friends get properly defined
				   on OpenVMS */
#endif

#define USE_SOCKETS

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "apps.h" /* needs to be included before the openssl headers! */
#include <openssl/e_os2.h>
#include <openssl/crypto.h>
#include <openssl/err.h>
#include <openssl/ssl.h>
#include <openssl/evp.h>
#include <openssl/bn.h>
#include <openssl/x509v3.h>

#if defined(NETWARE_CLIB)
#  ifdef NETWARE_BSDSOCK
#    include <sys/socket.h>
#    include <sys/bsdskt.h>
#  else
#    include <novsock2.h>
#  endif
#elif defined(NETWARE_LIBC)
#  ifdef NETWARE_BSDSOCK
#    include <sys/select.h>
#  else
#    include <novsock2.h>
#  endif
#endif
  
/* Maximum leeway in validity period: default 5 minutes */
#define MAX_VALIDITY_PERIOD	(5 * 60)


static OCSP_RESPONSE *query_responder(BIO *err, BIO *cbio, char *path,
				STACK_OF(CONF_VALUE) *headers,
				OCSP_REQUEST *req, int req_timeout)
	{
	int fd;
	int rv;
	int i;
	OCSP_REQ_CTX *ctx = NULL;
	OCSP_RESPONSE *rsp = NULL;
	fd_set confds;
	struct timeval tv;

	if (req_timeout != -1)
		BIO_set_nbio(cbio, 1);

	rv = BIO_do_connect(cbio);

	if ((rv <= 0) && ((req_timeout == -1) || !BIO_should_retry(cbio)))
		{
		BIO_puts(err, "Error connecting BIO\n");
		return NULL;
		}

	if (BIO_get_fd(cbio, &fd) <= 0)
		{
		BIO_puts(err, "Can't get connection fd\n");
		goto err;
		}

	if (req_timeout != -1 && rv <= 0)
		{
		FD_ZERO(&confds);
		openssl_fdset(fd, &confds);
		tv.tv_usec = 0;
		tv.tv_sec = req_timeout;
		rv = select(fd + 1, NULL, (void *)&confds, NULL, &tv);
		if (rv == 0)
			{
			BIO_puts(err, "Timeout on connect\n");
			return NULL;
			}
		}


	ctx = OCSP_sendreq_new(cbio, path, NULL, -1);
	if (!ctx)
		return NULL;

	for (i = 0; i < sk_CONF_VALUE_num(headers); i++)
		{
		CONF_VALUE *hdr = sk_CONF_VALUE_value(headers, i);
		if (!OCSP_REQ_CTX_add1_header(ctx, hdr->name, hdr->value))
			goto err;
		}

	if (!OCSP_REQ_CTX_set1_req(ctx, req))
		goto err;
	
	for (;;)
		{
		rv = OCSP_sendreq_nbio(&rsp, ctx);
		if (rv != -1)
			break;
		if (req_timeout == -1)
			continue;
		FD_ZERO(&confds);
		openssl_fdset(fd, &confds);
		tv.tv_usec = 0;
		tv.tv_sec = req_timeout;
		if (BIO_should_read(cbio))
			rv = select(fd + 1, (void *)&confds, NULL, NULL, &tv);
		else if (BIO_should_write(cbio))
			rv = select(fd + 1, NULL, (void *)&confds, NULL, &tv);
		else
			{
			BIO_puts(err, "Unexpected retry condition\n");
			goto err;
			}
		if (rv == 0)
			{
			BIO_puts(err, "Timeout on request\n");
			break;
			}
		if (rv == -1)
			{
			BIO_puts(err, "Select error\n");
			break;
			}

		}
	err:
	if (ctx)
		OCSP_REQ_CTX_free(ctx);

	return rsp;
	}

OCSP_RESPONSE *process_responder(BIO *err, OCSP_REQUEST *req,
			char *host, char *path, char *port, int use_ssl,
			STACK_OF(CONF_VALUE) *headers,
			int req_timeout)
	{
	BIO *cbio = NULL;
	SSL_CTX *ctx = NULL;
	OCSP_RESPONSE *resp = NULL;
	cbio = BIO_new_connect(host);
	if (!cbio)
		{
		BIO_printf(err, "Error creating connect BIO\n");
		goto end;
		}
	if (port) BIO_set_conn_port(cbio, port);
	if (use_ssl == 1)
		{
		BIO *sbio;
#if !defined(OPENSSL_NO_SSL2) && !defined(OPENSSL_NO_SSL3)
		ctx = SSL_CTX_new(SSLv23_client_method());
#elif !defined(OPENSSL_NO_SSL3)
		ctx = SSL_CTX_new(SSLv3_client_method());
#elif !defined(OPENSSL_NO_SSL2)
		ctx = SSL_CTX_new(SSLv2_client_method());
#else
		BIO_printf(err, "SSL is disabled\n");
			goto end;
#endif
		if (ctx == NULL)
			{
			BIO_printf(err, "Error creating SSL context.\n");
			goto end;
			}
		SSL_CTX_set_mode(ctx, SSL_MODE_AUTO_RETRY);
		sbio = BIO_new_ssl(ctx, 1);
		cbio = BIO_push(sbio, cbio);
		}
	resp = query_responder(err, cbio, path, headers, req, req_timeout);
	if (!resp)
		BIO_printf(bio_err, "Error querying OCSP responsder\n");
	end:
	if (cbio)
		BIO_free_all(cbio);
	if (ctx)
		SSL_CTX_free(ctx);
	return resp;
	}

#endif
