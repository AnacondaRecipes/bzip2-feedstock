@echo on

if not exist %LIBRARY_INC%\bzlib.h exit 1
if not exist %LIBRARY_LIB%\bzip2.lib exit 1
if not exist %LIBRARY_BIN%\bzip2.dll exit 1
if not exist %LIBRARY_LIB%\libbz2.lib exit 1
if not exist %LIBRARY_BIN%\libbz2.dll exit 1
if not exist %LIBRARY_LIB%\bzip2_static.lib exit 1
if not exist %LIBRARY_LIB%\libbz2_static.lib exit 1
if not exist %LIBRARY_BIN%\bzip2.exe exit 1


bzip2 -dc foo.bz2
if errorlevel 1 exit /B 1