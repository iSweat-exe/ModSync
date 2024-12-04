@echo off
chcp 65001 >nul
title 🛠️ Installation des Mods Minecraft 1.20.1
color 07

:: Début
echo =====================================================
echo        🛠️  Installation des Mods Minecraft v1.0.0 🛠️
echo =====================================================
echo.
echo Bienvenue dans le programme d'installation des mods !
echo Ce script supprimera vos anciens mods, puis installera les nouveaux.
echo.
pause
echo.

:: Localisation du dossier .minecraft/mods
set "modsFolder=%appdata%\.minecraft\mods"

echo.
echo [Vérification]

:: Vérification du dossier mods
echo 🔍 Vérification du dossier "mods"
if not exist "%modsFolder%" (
    echo ❌📁 Le dossier "mods" n'existe pas. Création en cours...
    mkdir "%modsFolder%"
    echo ✅📁 Dossier "mods" créé avec succès !
) else (
    echo ✅📁 Le dossier "mods" a été trouvé.
)
echo.

timeout /t 1 /nobreak >nul

echo.
echo [Suppression]

:: Suppression des anciens fichiers dans le dossier mods
echo 🗑️ Suppression des anciens mods dans le dossier
set /a modCount=0
for %%f in ("%modsFolder%\*") do set /a modCount+=1
del /q "%modsFolder%\*" >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Une erreur est survenue lors de la suppression des anciens mods.
    echo ❌📁 Vérifiez que le dossier n'est pas ouvert ailleurs.
    pause
    exit /b
) else (
    echo ✅📁 Tous les anciens mods ont été supprimés avec succès ! "%modCount% éléments"
)
echo.

timeout /t 1 /nobreak >nul

echo.
echo [Mods]

:: Téléchargement des mods
set /a totalMods=3
echo 🌐📁 Téléchargement des mods... "%totalMods% mods"
echo.

:: Téléchargement du Mod 1
:: The Anomaly
set /a modNumber=1
echo ⏳ Téléchargement du Mod %modNumber%...
powershell -Command "& {Invoke-WebRequest -Uri 'https://www.curseforge.com/api/v1/mods/1043571/files/5848458/download' -OutFile '%modsFolder%\The_Anomaly.jar'}" >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Une erreur est survenue lors du téléchargement du Mod %modNumber%.
    pause
    exit /b
) else (
    echo ✅ Mod %modNumber% installé avec succès ! "%modNumber%/%totalMods%"
)
echo.

:: Create
set /a modNumber+=1
echo ⏳ Téléchargement du Mod %modNumber%...
powershell -Command "& {Invoke-WebRequest -Uri 'https://www.curseforge.com/api/v1/mods/328085/files/5838779/download' -OutFile '%modsFolder%\Create.jar'}" >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Une erreur est survenue lors du téléchargement du Mod %modNumber%.
    pause
    exit /b
) else (
    echo ✅ Mod %modNumber% installé avec succès ! "%modNumber%/%totalMods%"
)
echo.


echo [Libs]
:: Téléchargement des Libs
:: GeckoLib
set /a modNumber+=1
echo ⏳ Téléchargement du Mod %modNumber%...
powershell -Command "& {Invoke-WebRequest -Uri 'https://www.curseforge.com/api/v1/mods/388172/files/5675221/download' -OutFile '%modsFolder%\GeckoLib.jar'}" >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Une erreur est survenue lors du téléchargement du Mod %modNumber%.
    pause
    exit /b
) else (
    echo ✅ %modNumber% mods ont etait installé avec succès ! "%modNumber%/%totalMods%"
)
echo.

echo.
echo 🎉 Tous les mods ont été installés avec succès !
echo 🎉 Vous pouvez maintenant lancer TLauncher / Minecraft Launcher
echo.
pause
exit
