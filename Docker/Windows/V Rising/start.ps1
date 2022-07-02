# V Rising Container Start Script
# https://github.com/thelamescriptkiddiemax/GameServer/tree/master/Docker/Windows/V%20Rising

# Variables
$argumentlist = "-serverName $ENV:SERVERNAME -saveName $ENV:SERVERNAME -gamePort $ENV:PORTGAME -queryPort $ENV:PORTQUERY -maxConnectedUsers $ENV:MAXPLAYERS -maxConnectedAdmins $ENV:MAXADMINS"

# SteamCMD
Clear-Host
Write-Host "Server update check..." -ForegroundColor Magenta
Update-SteamApp -AppID 1829350 -Path $ENV:SRVBP -Confirm:$False -Force
cd $ENV:SRVBP

# GameServer
Clear-Host
Write-Host "   V RISING `n   Starting Server..." -ForegroundColor Magenta
.\VRisingServer.exe $argumentlist
