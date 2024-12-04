@echo off
chcp 65001 >nul
title 🛠️ Minecraft Mods Installation 1.20.1
color 07

:: Set the URL for the update script
:: After performing the git push, wait 5 minutes (for GitHub servers to update)
set "RepoURLBat=https://raw.githubusercontent.com/iSweat-exe/ModSync/refs/heads/master/Loader.bat"

:: Folder to store the update
set "updateFolder=%appdata%\Local\UpdateMinecraftBat"
set "updateScript=%updateFolder%\Loader.bat"

:: Display variables for debugging
echo 🔧 Configuration variables:
echo RepoURLBat=%RepoURLBat%
echo updateFolder=%updateFolder%
echo updateScript=%updateScript%
echo.
pause

:: Force delete the update folder if it exists
echo 🗑️ Deleting the update folder if it exists...
rd /s /q "%updateFolder%"
echo Checking for error after deleting the folder...
if %errorlevel% neq 0 (
    echo ❌ Failed to delete the update folder.
    echo ErrorLevel=%errorlevel%
    pause
    exit /b
) else (
    echo ✅ Update folder deleted successfully.
)
pause

:: Check if the file already exists and delete it
echo 🔍 Checking if the update file exists...
if exist "%updateScript%" (
    echo 🗑️ The update file already exists, deleting the file...
    del "%updateScript%"
    echo Checking for error after deleting the file...
    if %errorlevel% neq 0 (
        echo ❌ Failed to delete the existing file.
        echo ErrorLevel=%errorlevel%
        pause
        exit /b
    ) else (
        echo ✅ Existing file deleted successfully.
    )
) else (
    echo ✅ No existing update file, download will proceed.
)
pause

:: Create the update folder if it does not exist
echo 📂 Checking if the update folder exists...
if not exist "%updateFolder%" (
    echo 📂 Creating the update folder...
    mkdir "%updateFolder%"
    echo Checking for error after creating the folder...
    if %errorlevel% neq 0 (
        echo ❌ Failed to create the update folder.
        echo ErrorLevel=%errorlevel%
        pause
        exit /b
    ) else (
        echo ✅ Update folder created successfully.
    )
) else (
    echo ✅ Update folder already exists.
)
pause

:: Checking for updates
echo 🌐 Downloading the new update script...
powershell -Command "& {Invoke-WebRequest -Uri '%RepoURLBat%' -OutFile '%updateScript%'}"
echo Checking for error after download...
if %errorlevel% neq 0 (
    echo ❌ Failed to download the update file. Please check your internet connection.
    echo ErrorLevel=%errorlevel%
    pause
    exit /b
)

echo ✅ New script downloaded successfully!
pause

:: Run the newly downloaded script
echo 🔄 Running the update...
start "" "%updateScript%"
pause

:: End of script
echo 🎉 The update is complete!
pause
exit
