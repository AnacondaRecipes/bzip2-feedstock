@echo on

REM Set empty variables to avoid an error because by defaults the value is "1.0",
REM see https://github.com/AnacondaRecipes/aggregate/blob/0de119406a04fb8ba753524c6ac035c75c1fe2a7/conda_build_config.yaml#L16
set BZIP2=
set BZIP=

REM Build step
nmake -f makefile.msc
if errorlevel 1 exit 1

REM Install step
copy bzlib.h %LIBRARY_INC% || exit 1
copy libbz2_static.lib %LIBRARY_LIB% || exit 1
REM Some packages expect 'bzip2.lib', so make another copy
copy libbz2_static.lib %LIBRARY_LIB%\bzip2_static.lib || exit 1

copy libbz2.lib %LIBRARY_LIB% || exit 1
REM Some packages expect 'bzip2.lib', so make copies
copy libbz2.lib %LIBRARY_LIB%\bzip2.lib || exit 1
copy libbz2.exp %LIBRARY_LIB%\libbz2.exp || exit 1
copy libbz2.def %LIBRARY_LIB%\libbz2.def || exit 1

copy libbz2.dll %LIBRARY_BIN% || exit 1
REM Some packages expect 'bzip2.dll', so make copies
copy libbz2.dll %LIBRARY_BIN%\bzip2.dll || exit 1

REM Copy also uppercased variant of the dll
copy LIBBZ2.dll %LIBRARY_BIN%\LIBBZ2.dll || exit 1

REM Copy exe files
copy *.exe %LIBRARY_BIN% || exit 1
