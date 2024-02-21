@echo on

if not exist %LIBRARY_INC%\bzlib.h exit 1
if not exist %LIBRARY_LIB%\bzip2.lib exit 1
if not exist %LIBRARY_BIN%\bzip2.dll exit 1
if not exist %LIBRARY_LIB%\libbz2.lib exit 1
if not exist %LIBRARY_LIB%\libbz2.def exit 1
if not exist %LIBRARY_BIN%\libbz2.dll exit 1
if not exist %LIBRARY_LIB%\bzip2_static.lib exit 1
if not exist %LIBRARY_LIB%\libbz2_static.lib exit 1
if not exist %LIBRARY_BIN%\bzip2.exe exit 1

echo "hello world" >foo
bzip2.exe -zv foo

::bzip2.exe -dc foo.txt.bz2

%CC% -o bz2 bz2.c /I%PREFIX%\Library\include\ /link /LIBPATH:"%PREFIX%\Library\lib" libbz2.lib
if errorlevel 1 exit /B 1

bz2 foo.bz2
if errorlevel 1 exit /B 1
