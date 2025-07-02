@echo off
setlocal

:: --- Configuration ---
set "LIBREOFFICE_PATH_PART=\LibreOffice\share\registry"
set "TARGET_FILENAME=onlineupdate.xcd"

:: --- Get the directory of the current script ---
set "SCRIPT_DIR=%~dp0"

:: --- Define source and destination paths ---
set "SOURCE_FILE=%SCRIPT_DIR%%TARGET_FILENAME%"
set "DEST_DIR=%PROGRAMFILES%%LIBREOFFICE_PATH_PART%"
set "DEST_FILE=%DEST_DIR%\%TARGET_FILENAME%"

echo.
echo =======================================================
echo   LibreOffice Online Update XCD Replacement Script
echo =======================================================
echo.

:: --- Check if running as administrator ---
:: This is a simple check, not foolproof, but good enough for most cases.
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: This script must be run as an Administrator.
    echo Please right-click the script and select "Run as administrator".
    echo.
    pause
    exit /b 1
)

:: --- Verify source file exists ---
if not exist "%SOURCE_FILE%" (
    echo ERROR: Source file not found!
    echo Expected: "%SOURCE_FILE%"
    echo Please ensure "%TARGET_FILENAME%" is in the same directory as this script.
    echo.
    pause
    exit /b 1
)

:: --- Verify LibreOffice installation path exists ---
if not exist "%DEST_DIR%" (
    echo WARNING: LibreOffice registry path not found!
    echo Expected: "%DEST_DIR%"
    echo LibreOffice might not be installed at the default location, or the path is incorrect.
    echo Attempting to proceed, but it might fail.
    echo.
    :: Optionally, you could exit here if you want to be strict.
    :: exit /b 1
)

echo Source file: "%SOURCE_FILE%"
echo Destination: "%DEST_FILE%"
echo.

:: --- Perform the file replacement ---
echo Attempting to replace "%TARGET_FILENAME%"...
copy /Y "%SOURCE_FILE%" "%DEST_DIR%"

:: --- Check if the copy operation was successful ---
if %errorlevel% equ 0 (
    echo.
    echo SUCCESS: "%TARGET_FILENAME%" has been replaced.
    echo.
) else (
    echo.
    echo ERROR: Failed to replace "%TARGET_FILENAME%".
    echo This could be due to permissions or the file being in use.
    echo Ensure LibreOffice is completely closed and try again.
    echo.
)

echo Script finished.
pause
endlocal
