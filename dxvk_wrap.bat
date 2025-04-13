@echo off
setlocal

:: Ask for game directory
echo === DXVK Vulkan Wrapper ===
set /p GAME_PATH="Enter the full path to the game folder (e.g. D:\Games\DMC4SE): "

:: Optional: You can hardcode your DXVK ZIP path here if already downloaded
set DXVK_ZIP=dxvk-2.3.tar.gz
set DXVK_DIR=dxvk-2.3
set TEMP_DIR=%TEMP%\dxvk_tmp

:: Create temp folder
if exist "%TEMP_DIR%" rd /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%"

:: Extract DXVK ZIP (make sure 7z is installed or bundled)
echo Extracting DXVK...
7z x "%DXVK_ZIP%" -o"%TEMP_DIR%" >nul
cd /d "%TEMP_DIR%\%DXVK_DIR%\x64"

:: Copy DLLs to game folder
echo Copying d3d11.dll and dxgi.dll to: %GAME_PATH%
copy /Y d3d11.dll "%GAME_PATH%" >nul
copy /Y dxgi.dll "%GAME_PATH%" >nul

:: Create dxvk.conf with logging & HUD (optional)
echo Creating dxvk.conf...
(
    echo dxvk.log = info
    echo dxvk.hud = fps,version
) > "%GAME_PATH%\dxvk.conf"

echo.
echo ✅ DXVK Vulkan wrapper installed successfully!
echo You can now launch the game using Vulkan.
pause
exit
