@echo on

REM edited from the one from Anaconda

set BZIP2=
set BZIP=

REM Build step
nmake -f makefile.msc
if errorlevel 1 exit 1


REM Install step
copy libbz2_static.lib %LIBRARY_LIB% || exit 1
REM Some packages expect 'bzip2.lib', so make another copy
copy libbz2_static.lib %LIBRARY_LIB%\bzip2_static.lib || exit 1
copy bzlib.h %LIBRARY_INC% || exit 1


copy libbz2.lib %LIBRARY_LIB% || exit 1
REM Some packages expect 'bzip2.lib', so make copies
copy libbz2.lib %LIBRARY_LIB%\bzip2.lib || exit 1
copy libbz2.exp %LIBRARY_LIB%\libbz2.exp || exit 1
copy libbz2.def %LIBRARY_LIB%\libbz2.def || exit 1
REM Some packages expect 'bzip2.dll', so make copies
copy libbz2.dll %LIBRARY_BIN% || exit 1
copy libbz2.dll %LIBRARY_BIN%\bzip2.dll || exit 1

copy LIBBZ2.dll %LIBRARY_BIN%\LIBBZ2.dll || exit 1

copy *.exe %LIBRARY_BIN% || exit 1
