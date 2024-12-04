@echo off
chcp 65001 >nul
title 🛠️ Installation des Mods Minecraft 1.20.1
color 07

:: Définir l'URL pour le script de mise à jour
:: Une fois le git push effectué, attendre 5 minutes (le temps que les serveurs de GitHub s'actualisent)
set "RepoURLBat=https://raw.githubusercontent.com/iSweat-exe/ModSync/refs/heads/master/Loader.bat"

:: Dossier où stocker la mise à jour
set "updateFolder=%appdata%\Local\UpdateMinecraftBat"
set "updateScript=%updateFolder%\Loader.bat"

:: Afficher les variables pour débogage
echo 🔧 Variables de configuration :
echo RepoURLBat=%RepoURLBat%
echo updateFolder=%updateFolder%
echo updateScript=%updateScript%
echo.
pause

:: Supprimer le dossier de mise à jour de force s'il existe
echo 🗑️ Suppression du dossier de mise à jour s'il existe...
rd /s /q "%updateFolder%"
echo Vérification de l'erreur après suppression du dossier...
if %errorlevel% neq 0 (
    echo ❌ Échec de la suppression du dossier de mise à jour.
    echo ErrorLevel=%errorlevel%
    pause
    exit /b
) else (
    echo ✅ Dossier de mise à jour supprimé avec succès.
)
pause

:: Vérifier si le fichier existe déjà et le supprimer
echo 🔍 Vérification si le fichier de mise à jour existe...
if exist "%updateScript%" (
    echo 🗑️ Le fichier de mise à jour existe déjà, suppression du fichier...
    del "%updateScript%"
    echo Vérification de l'erreur après suppression du fichier...
    if %errorlevel% neq 0 (
        echo ❌ Échec de la suppression du fichier existant.
        echo ErrorLevel=%errorlevel%
        pause
        exit /b
    ) else (
        echo ✅ Fichier existant supprimé avec succès.
    )
) else (
    echo ✅ Aucun fichier de mise à jour existant, téléchargement prévu.
)
pause

:: Créer le dossier de mise à jour s'il n'existe pas
echo 📂 Vérification si le dossier de mise à jour existe...
if not exist "%updateFolder%" (
    echo 📂 Création du dossier de mise à jour...
    mkdir "%updateFolder%"
    echo Vérification de l'erreur après création du dossier...
    if %errorlevel% neq 0 (
        echo ❌ Échec de la création du dossier de mise à jour.
        echo ErrorLevel=%errorlevel%
        pause
        exit /b
    ) else (
        echo ✅ Dossier de mise à jour créé avec succès.
    )
) else (
    echo ✅ Dossier de mise à jour déjà existant.
)
pause

:: Vérification des mises à jour
echo 🌐 Téléchargement du nouveau script de mise à jour...
powershell -Command "& {Invoke-WebRequest -Uri '%RepoURLBat%' -OutFile '%updateScript%'}"
echo Vérification de l'erreur après téléchargement...
if %errorlevel% neq 0 (
    echo ❌ Échec du téléchargement du fichier de mise à jour. Vérifiez votre connexion Internet.
    echo ErrorLevel=%errorlevel%
    pause
    exit /b
)

echo ✅ Nouveau script téléchargé avec succès !
pause

:: Exécution du nouveau script téléchargé
echo 🔄 Exécution de la mise à jour...
start "" "%updateScript%"
pause

:: Fin du script
echo 🎉 La mise à jour est terminée !
pause
exit
