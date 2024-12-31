:: Make sure to run in build directory
:: Also make sure to have MinGW installed at C:\mingw64
@echo off
setlocal

REM Define the path to the nm tool, dlltool, and the input DLL
set NM_TOOL=C:\mingw64\bin\nm.exe
set DLLTOOL=C:\mingw64\bin\dlltool.exe
set DLL_PATH=libquickjs.dll
set DEF_FILE=libquickjs.def
set LIB_FILE=libquickjs.lib


REM Check if nm tool exists
if not exist "%NM_TOOL%" (
    echo Error: nm tool not found!
    exit /b
)

REM Check if dlltool exists
if not exist "%DLLTOOL%" (
    echo Error: dlltool tool not found!
    exit /b
)

REM Check if DLL file exists
if not exist "%DLL_PATH%" (
    echo Error: DLL file not found!
    exit /b
)

echo Generating DEF file for %DLL_PATH%...

REM Generate the symbols from the DLL and save them to a temporary file
"%NM_TOOL%" -g --defined-only "%DLL_PATH%" > temp_symbols.txt

REM Start creating the DEF file
echo LIBRARY libquickjs > "%DEF_FILE%"
echo EXPORTS >> "%DEF_FILE%"

REM Process the symbols and write them into the DEF file, filtering out unwanted lines
for /f "tokens=3" %%a in (temp_symbols.txt) do (
    REM Skip lines that contain ".refptr" (or any other patterns you want to exclude)
    echo %%a | findstr /v /i ".refptr" >> "%DEF_FILE%"
)

REM Clean up the temporary file
del temp_symbols.txt

echo DEF file generated: %DEF_FILE%

echo Generating LIB file for %DLL_PATH%...

REM Now use dlltool to generate the .lib file from the .def file
"%DLLTOOL%" --def "%DEF_FILE%" --output-lib "%LIB_FILE%" --dllname "%DLL_PATH%"

echo LIB file generated: %LIB_FILE%

endlocal