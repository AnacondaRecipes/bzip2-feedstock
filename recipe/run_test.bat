@echo on

if not exist %LIBRARY_INC%\bzlib.h exit 1
if not exist %LIBRARY_LIB%\bzip2.lib exit 1
if not exist %LIBRARY_BIN%\bzip2.dll exit 1
if not exist %LIBRARY_LIB%\libbz2.lib exit 1
if not exist %LIBRARY_BIN%\libbz2.dll exit 1
if not exist %LIBRARY_LIB%\bzip2_static.lib exit 1
if not exist %LIBRARY_LIB%\libbz2_static.lib exit 1
if not exist %LIBRARY_BIN%\bzip2.exe exit 1

echo "hello world" >foo.txt
bzip2.exe -zv foo.txt

::bzip2.exe -dc foo.txt.bz2

%CC% /Tc bz2.c /I %CONDA_PREFIX%\Library\include /link /LIBPATH:"%CONDA_PREFIX%\Library\lib" /dll /implib:libbz2.lib /out:defaults-bz2.exe bz2.obj
if errorlevel 1 exit /B 1

defaults-bz2.exe foo.txt.bz2
if errorlevel 1 exit /B 1