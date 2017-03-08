# Microsoft Developer Studio Project File - Name="openssl" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=openssl - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "openssl.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "openssl.mak" CFG="openssl - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "openssl - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "openssl - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "openssl - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\out32dll\Release"
# PROP Intermediate_Dir "..\..\tmp32dll\Release\openssl"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MD /W3 /Ox /Ob2 /I "..\..\inc32\\" /I "..\..\tmp32dll" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "MONOLITH" /D "WIN32" /D "WIN32_LEAN_AND_MEAN" /D "OPENSSL_SYSNAME_WIN32" /D "OPENSSL_THREADS" /D "DSO_WIN32" /D "OPENSSL_NO_KRB5" /FD /GF /c
# SUBTRACT CPP /WX
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 ws2_32.lib Gdi32.lib User32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "openssl - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\out32dll\Debug\"
# PROP Intermediate_Dir "..\..\tmp32dll\Debug\openssl"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /Ob2 /I "..\..\inc32\\" /I "..\..\tmp32dll" /D "_CONSOLE" /D "_MBCS" /D "MONOLITH" /D "DSO_WIN32" /D "OPENSSL_THREADS" /D "WIN32_LEAN_AND_MEAN" /D "WIN32" /D "_DEBUG" /D "MK1MF_BUILD" /D "OPENSSL_SYSNAME_WIN32" /FD /c
# SUBTRACT CPP /WX /Fr
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ws2_32.lib Gdi32.lib User32.lib /nologo /subsystem:console /incremental:no /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "openssl - Win32 Release"
# Name "openssl - Win32 Debug"
# Begin Source File

SOURCE=..\..\apps\app_rand.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\apps.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\asn1pars.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\ca.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\ciphers.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\cms.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\crl.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\crl2p7.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\dgst.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\dh.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\dhparam.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\dsa.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\dsaparam.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\ec.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\ecparam.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\enc.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\engine.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\errstr.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\gendh.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\gendsa.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\genpkey.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\genrsa.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\nseq.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\ocsp.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\openssl.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\passwd.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\pkcs12.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\pkcs7.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\pkcs8.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\pkey.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\pkeyparam.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\pkeyutl.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\prime.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\rand.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\req.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\rsa.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\rsautl.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\s_cb.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\s_client.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\s_server.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\s_socket.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\s_time.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\sess_id.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\smime.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\speed.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\spkac.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\srp.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\ts.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\verify.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\version.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\winrand.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\x509.c
# End Source File
# End Target
# End Project
