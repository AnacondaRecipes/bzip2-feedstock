@echo on

if not exist %LIBRARY_INC%\bzlib.h exit 1
if not exist %LIBRARY_LIB%\bzip2.lib exit 1
if not exist %LIBRARY_BIN%\bzip2.dll exit 1
if not exist %LIBRARY_LIB%\libbz2.lib exit 1
if not exist %LIBRARY_BIN%\libbz2.dll exit 1
if not exist %LIBRARY_LIB%\bzip2_static.lib exit 1
if not exist %LIBRARY_LIB%\libbz2_static.lib exit 1


%CC% /Tc bz2.c /I %CONDA_PREFIX%\Library\include /link /LIBPATH:"%CONDA_PREFIX%\Library\bin" /out:defaults-bz2

::%CC% -I%LIBRARY_PREFIX%\include -L%LIBRARY_PREFIX%\bin -lbz2 -o defaults-bz2 bz2.c
::if errorlevel 1 exit /B 1

defaults-bz2.exe foo.bz2
if errorlevel 1 exit /B 1