@echo off
chcp 65001 >nul
title 🛠️ ModSync Updater 🛠️
color 07

:: Set the URL for the update script
:: After performing the git push, wait 5 minutes (for GitHub servers to update)
set "RepoURLBat=https://raw.githubusercontent.com/iSweat-exe/ModSync/refs/heads/master/Loader.bat"

:: Folder to store the update
set "updateFolder=%appdata%\Local\UpdateMinecraftBat"
set "updateScript=%updateFolder%\Loader.bat"

:: Force delete the update folder if it exists
rd /s /q "%updateFolder%"

:: Check if the file already exists and delete it
if exist "%updateScript%" (
    del "%updateScript%"
)

:: Create the update folder if it does not exist
if not exist "%updateFolder%" (
    mkdir "%updateFolder%"
)

:: Checking for updates
powershell -Command "& {Invoke-WebRequest -Uri '%RepoURLBat%' -OutFile '%updateScript%'}"

:: Run the newly downloaded script
start "" "%updateScript%"

:: End of script
echo ❤️ ModSync created by iSweat. Thank you for using it! ❤️
exit
