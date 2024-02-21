@echo on

if not exist %LIBRARY_INC%\bzlib.h exit 1
if not exist %LIBRARY_LIB%\bzip2.lib exit 1
if not exist %LIBRARY_BIN%\bzip2.dll exit 1
if not exist %LIBRARY_LIB%\libbz2.lib exit 1
if not exist %LIBRARY_BIN%\libbz2.dll exit 1
if not exist %LIBRARY_LIB%\bzip2_static.lib exit 1
if not exist %LIBRARY_LIB%\libbz2_static.lib exit 1
if not exist %LIBRARY_BIN%\bzip2.exe exit 1

echo "hello world" >foo
bzip2.exe -zv foo

::bzip2.exe -dc foo.txt.bz2

link /dll /implib:libbz2.lib /out:libbz2.dll /def:libbz2.def $(OBJS)
%CC% -g -o bz2-gcc bz2.c -I %CONDA_PREFIX%\Library\include\ -L "%CONDA_PREFIX%\Library\lib" -lbz2
if errorlevel 1 exit /B 1

bz2-gcc foo.bz2
if errorlevel 1 exit /B 1
