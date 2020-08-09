@echo off

set PATH=%SystemRoot%
set PATH=%PATH%;%SystemRoot%\System32
set PATH=%PATH%;%SystemRoot%\System32\Wbem
set PATH=%PATH%;C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin

set INCLUDE=
set LIBPATH=

@call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
@SET Include=%Include%;C:\Program Files\Microsoft SDKs\Windows\v7.1\Include

set PY3= PYTHON3="C:\devtools\Python\Python36" PYTHON3_VER=36 DYNAMIC_PYTHON3=yes
set PY2= PYTHON="C:\devtools\Python\Python27" PYTHON_VER=27 DYNAMIC_PYTHON=yes
set LUA= LUA="D:\Dev\vim\lua" DYNAMIC_LUA=yes LUA_VER=5.3
set PERL= PERL="D:\Dev\vim\perl" DYNAMIC_PERL=yes PERL_VER=524

set OPT= CPU=AMD64 FEATURES=HUGE USE_MSVCRT=yes MAP=no IME=yes MBYTE=yes ICONV=yes XPM=no TERMINAL=yes DEBUG=no
set OPT2= %PY3% %PY2% %LUA% %PERL%

pushd D:\Dev\vim\vim\src
rmdir /s /q ObjCYHAMD64 ObjGXYHAMD64
nmake -f Make_mvc.mak clean
nmake -f Make_mvc.mak %OPT% %OPT2% GUI=no
nmake -f Make_mvc.mak %OPT% %OPT2% GUI=yes DIRECTX=yes
move /y C:\app\vim\vim.exe C:\app\vim\vim.bak
move /y C:\app\vim\gvim.exe C:\app\vim\gvim.bak
move /y vim.exe C:\app\vim\
move /y gvim.exe C:\app\vim\
move /y xxd\xxd.exe C:\app\vim\
move /y tee\tee.exe C:\app\vim\
move /y vimrun.exe C:\app\vim\
move /y GvimExt\gvimext.dll C:\app\vim\
XCOPY D:\Dev\vim\vim\runtime\* C:\app\vim\vim80\ /D /S /R /Y /I /K
popd