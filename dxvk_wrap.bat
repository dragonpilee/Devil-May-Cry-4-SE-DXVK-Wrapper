@echo off
setlocal EnableDelayedExpansion

echo ==========================================
echo       DXVK Vulkan Wrapper Installer
echo ==========================================

:: Set the DXVK archive name
set "DXVK_ARCHIVE=dxvk-2.6.1.tar.gz"
set "DXVK_DIR=dxvk-2.6.1"

:: Check for 7z.exe
if not exist "7z.exe" (
    echo ❌ 7z.exe not found! Please make sure 7-Zip CLI is in this folder.
    pause
    exit /b
)

:: Check for DXVK archive
if not exist "%DXVK_ARCHIVE%" (
    echo ❌ %DXVK_ARCHIVE% not found!
    echo Please download it from: https://github.com/doitsujin/dxvk/releases/tag/v2.6.1
    pause
    exit /b
)

:: Ask user for game directory
set /p GAME_DIR=Enter the full path to your game folder (e.g. D:\Games\DMC4SE): 
if not exist "!GAME_DIR!\" (
    echo ❌ Invalid directory.
    pause
    exit /b
)

echo.
echo 🔧 Extracting DXVK...
7z x "%DXVK_ARCHIVE%" -aoa >nul
7z x "%DXVK_DIR%.tar" -aoa >nul

:: Check if x64 DLLs exist
if not exist "%DXVK_DIR%\x64\d3d11.dll" (
    echo ❌ Extraction failed or DXVK structure is incorrect.
    pause
    exit /b
)

echo.
echo 📁 Copying Vulkan DLLs to: !GAME_DIR!
copy /Y "%DXVK_DIR%\x64\d3d11.dll" "!GAME_DIR!" >nul
copy /Y "%DXVK_DIR%\x64\dxgi.dll" "!GAME_DIR!" >nul

:: Optional dxvk.conf
echo dxvk.hud = devinfo,fps > "!GAME_DIR!\dxvk.conf"

echo.
echo ✅ DXVK Vulkan wrapper installed successfully!
echo You can now launch your game using Vulkan.
pause
