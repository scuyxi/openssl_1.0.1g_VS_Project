# Microsoft Developer Studio Project File - Name="SSLeay32" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=SSLeay32 - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "SSLeay32.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "SSLeay32.mak" CFG="SSLeay32 - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "SSLeay32 - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "SSLeay32 - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "SSLeay32 - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\out32dll\Release"
# PROP Intermediate_Dir "..\..\tmp32dll\Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /G6 /MD /W3 /Ox /Ob2 /Gy /I "..\..\inc32\\" /I "..\..\tmp32dll" /D "_WINDOWS" /D "WIN32" /D "WIN32_LEAN_AND_MEAN" /D "OPENSSL_THREADS" /D "DSO_WIN32" /FD /GF /c
# SUBTRACT CPP /WX
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 ws2_32.lib /nologo /subsystem:windows /dll /machine:I386

!ELSEIF  "$(CFG)" == "SSLeay32 - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\out32dll\Debug"
# PROP Intermediate_Dir "..\..\tmp32dll\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /FD /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /Ob2 /I "..\..\inc32\\" /I "..\..\tmp32dll" /D "_WINDOWS" /D "DL_ENDIAN" /D "L_ENDIAN" /D "DSO_WIN32" /D "OPENSSL_THREADS" /D "WIN32_LEAN_AND_MEAN" /D "WIN32" /D "_DEBUG" /D "MK1MF_BUILD" /FD /c
# SUBTRACT CPP /WX /Fr
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 ws2_32.lib /nologo /subsystem:windows /dll /incremental:no /debug /machine:I386 /pdbtype:sept
# SUBTRACT LINK32 /verbose

!ENDIF 

# Begin Target

# Name "SSLeay32 - Win32 Release"
# Name "SSLeay32 - Win32 Debug"
# Begin Source File

SOURCE=..\..\ssl\bio_ssl.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\d1_both.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\d1_clnt.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\d1_enc.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\d1_lib.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\d1_meth.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\d1_pkt.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\d1_srtp.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\d1_srvr.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\kssl.c
# End Source File
# Begin Source File

SOURCE=..\..\apps\ocspa.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s23_clnt.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s23_lib.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s23_meth.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s23_pkt.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s23_srvr.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s2_clnt.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s2_enc.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s2_lib.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s2_meth.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s2_pkt.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s2_srvr.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s3_both.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s3_cbc.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s3_clnt.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s3_enc.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s3_lib.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s3_meth.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s3_pkt.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\s3_srvr.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_algs.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_asn1.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_cert.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_ciph.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_err.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_err2.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_lib.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_rsa.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_sess.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_stat.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\ssl_txt.c
# End Source File
# Begin Source File

SOURCE=..\..\ms\ssleay32.def
# End Source File
# Begin Source File

SOURCE=..\..\ssl\t1_clnt.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\t1_enc.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\t1_lib.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\t1_meth.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\t1_reneg.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\t1_srvr.c
# End Source File
# Begin Source File

SOURCE=..\..\ssl\tls_srp.c
# End Source File
# End Target
# End Project
