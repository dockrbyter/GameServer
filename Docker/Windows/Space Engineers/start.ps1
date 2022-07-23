# Space Engineers Container Start Script
# https://github.com/dockrbyter/GameServer/tree/master/Docker/Windows/

# Variables
$seargutments = "'-noconsole' '-checkAlive' '-path C:\world\Saves'" 
$srvtime = (Get-Date -Format "dd/MM/yyyy HH:mm:ss")
$tringsrv = [System.String]::Concat("        Server Start Time:     ", $srvtime, "`n        Game Port:             ", $ENV:PORTGAME, "`n        API Port:              ", $ENV:PORTWEB)

# SteamCMD
Clear-Host
Write-Host "Server update check..." -ForegroundColor Magenta
Update-SteamApp -AppID 298740 -Path $ENV:SRVBP -Confirm:$False -Force
Set-Location -Path $ENV:SRVBP\DedicatedServer64

# Game Server
Clear-Host
Write-Host "`n`n   Space Engineers `n" -ForegroundColor Magenta
Write-Host $tringsrv -ForegroundColor Yellow
Write-Host "`n   https://hub.docker.com/u/dockrbyter `n   https://github.com/dockrbyter/GameServer `n   https://steamcommunity.com/profiles/76561198120366828/myworkshopfiles/?section=guides" -ForegroundColor Green
Write-Host "`n   DOCKRBYTER `n" -ForegroundColor Magenta
.\SpaceEngineersDedicated.exe -Argumentlist $seargutments
