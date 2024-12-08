@echo off
chcp 65001 >nul
title 🛠️ ModSync Tool 🛠️
color 07

:: Start
echo =====================================================
echo                🛠️  ModSync [v1.2.0] 🛠️
echo =====================================================
echo.
echo Welcome to the mod installation program!
echo This script will remove your old mods and then install the new ones.
echo ❤️ ModSync created by iSweat. Thank you for using it! ❤️
echo.
pause
echo.

:: Locating the .minecraft/mods folder
set "modsFolder=%appdata%\.minecraft\mods"

echo.
echo [Verification]

:: Verifying the mods folder
echo 🔍 Verifying the "mods" folder
if not exist "%modsFolder%" (
    echo ❌📁 The 'mods' folder does not exist. Creating it now...
    mkdir "%modsFolder%"
    echo ✅📁 'mods' folder created successfully!
) else (
    echo ✅📁 The 'mods' folder has been found.
)
echo.

timeout /t 1 /nobreak >nul

echo.
echo [Deleting]

:: Deleting old files in the mods folder
echo 🗑️ Deleting old mods in the folder
set /a modCount=0
for %%f in ("%modsFolder%\*") do set /a modCount+=1
del /q "%modsFolder%\*" >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ An error occurred while deleting the old mods.
    echo ❌📁 Make sure the folder is not open elsewhere
    pause
    exit /b
) else (
    echo ✅📁 All old mods have been successfully deleted! "%modCount% items"
)
echo.

timeout /t 1 /nobreak >nul

echo.
echo [Mods]

:: Check if mod-list.txt exists
if not exist "mod-list.txt" (
    echo ❌ The file "mod-list.txt" is missing. Please create it and try again.
    pause
    exit /b
)

:: Download mods from mod-list.txt
set /a modNumber=0
for /f "tokens=1,2 delims= " %%A in (mod-list.txt) do (
    set /a modNumber+=1
    echo ⏳ Downloading Mod %%A...
    powershell -Command "& {Invoke-WebRequest -Uri '%%A' -OutFile '%modsFolder%\%%B'}" >nul 2>&1
    if %errorlevel% neq 0 (
        echo ❌ An error occurred while downloading Mod %%A.
        pause
        exit /b
    ) else (
        echo ✅ Mod %%B installed successfully! "%modNumber%"
    )
)
echo.

echo 🎉 All mods have been installed successfully! 🎉
echo 🎉 You can now launch Minecraft 🎉
echo ❤️ ModSync created by iSweat. Thank you for using it! ❤️
echo.
pause
exit