@echo off
chcp 65001 >nul
title 🛠️ ModSync Tool 🛠️
color 07

:: Start
echo =====================================================
echo                🛠️  ModSync v1.1.0 🛠️
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

:: Downloading the mods
set /a totalMods=3
echo 🌐📁 Downloading the mods... "%totalMods% mods"
echo.

:: Downloading Mod 1
:: The Anomaly
set /a modNumber=1
echo ⏳ Downloading Mod %modNumber%...
powershell -Command "& {Invoke-WebRequest -Uri 'https://www.curseforge.com/api/v1/mods/1043571/files/5848458/download' -OutFile '%modsFolder%\The_Anomaly.jar'}" >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ An error occurred while downloading Mod %modNumber%.
    pause
    exit /b
) else (
    echo ✅ Mod %modNumber% installed successfully! "%modNumber%/%totalMods%"
)
echo.

:: Create
set /a modNumber+=1
echo ⏳ Downloading Mod %modNumber%...
powershell -Command "& {Invoke-WebRequest -Uri 'https://www.curseforge.com/api/v1/mods/328085/files/5838779/download' -OutFile '%modsFolder%\Create.jar'}" >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ An error occurred while downloading Mod %modNumber%.
    pause
    exit /b
) else (
    echo ✅ Mod %modNumber% installed successfully! "%modNumber%/%totalMods%"
)
echo.


echo [Libs]
:: Downloading the Libs
:: GeckoLib
set /a modNumber+=1
echo ⏳ Downloading Mod %modNumber%...
powershell -Command "& {Invoke-WebRequest -Uri 'https://www.curseforge.com/api/v1/mods/388172/files/5675221/download' -OutFile '%modsFolder%\GeckoLib.jar'}" >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ An error occurred while downloading Mod %modNumber%.
    pause
    exit /b
) else (
    echo ✅ %modNumber% mods have been installed successfully! "%modNumber%/%totalMods%"
)
echo.

echo.
echo 🎉 All mods have been installed successfully! 🎉
echo 🎉 You can now launch Minecraft 🎉
echo ❤️ ModSync created by iSweat. Thank you for using it! ❤️
echo.
pause
exit