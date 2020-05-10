<#
muss-manager.ps1
.DESCRIPTION

    Max's universal Steam Server - Manager
https://github.com/thelamescriptkiddiemax/GameServer
#>
#--- Variables ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# SERVERSETTINGS
$gamename = "KerbalSpaceProgram"                       # Name of the Game                                      EX Ark
$gameinstance = "01"                            # Instance (Number) of the game server                  EX 01




# SCRIPTSETTINGS
$rootgamesrvPATH = "C:"                                     # Path to the game server directory                     EX C:\stuff\morestuff\
$rootgamesrvDIR = "GameServer"                              # Name of game server directory                         EX GameServers
$pfadBackup = ("$rootgamesrvPATH\$rootgamesrvDIR\Backup")   # Path to the backup
$scriptspeed = "2"                                          # Timespan to show messages in Seconds                  EX 2


#--- Vorbereitung -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$stringhost = [System.String]::Concat("[ ", $env:UserName, " @ ", $env:computername, " @ ", ((Get-WmiObject Win32_ComputerSystem).Domain), " ", (Get-CimInstance Win32_OperatingSystem | Select-Object Caption), ": ", 
((Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\" -Name ReleaseID).ReleaseId), " ]   ", (Get-Date -Format "dd/MM/yyyy HH:mm"), "`n", "[ ", $MyInvocation.MyCommand.Name, " ]", "`n","`n") 
$stringhost = $stringhost.replace("{Caption=Microsoft"," ").replace("}", " ")

$gameconfig = "Config"
$savegame = "Universe"
$gameEXE = "DMPServer.exe"
$updateEXE = "DMPUpdater.exe"


$stringrdfound = [System.String]::Concat("   Root directory ok :D `n   ", $rootgamesrv, "`n")
$stringrdfoundnot = [System.String]::Concat("   Root directory not found -,- Create new directory... `n   ", $rootgamesrv, "`n")
$stringrdcreate = [System.String]::Concat("   Root directory created! `n   ", $rootgamesrv, "`n")


$Host.UI.RawUI.BackgroundColor = 'DarkGray'                                                                                                                      # Script Hintergrundfarbe
$Host.UI.RawUI.ForegroundColor = 'White'                                                                                                                       # Script Textfarbe

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function headlinekspdmp {                                                                                                                                         # Show Headline

    #Clear-Host
    Write-Host $stringhost -ForegroundColor Magenta
    Write-Host " _  __ ____  ____  " -ForegroundColor Green
    Write-Host "/ |/ // ___\/  __\ " -ForegroundColor Green
    Write-Host "|   / |    \|  \/| " -ForegroundColor Green
    Write-Host "|   \ \___ ||  __/ " -ForegroundColor Green
    Write-Host "\_|\_\\____/\_/    " -ForegroundColor Green
    Write-Host " "
    Write-Host " ____  _      ____ " -ForegroundColor Green
    Write-Host "/  _ \/ \__/|/  __\" -ForegroundColor Green
    Write-Host "| | \|| |\/|||  \/|" -ForegroundColor Green
    Write-Host "| |_/|| |  |||  __/" -ForegroundColor Green
    Write-Host "\____/\_/  \|\_/   " -ForegroundColor Green
    Write-Host " "
    Write-Host " ____  _           " -ForegroundColor Green
    Write-Host "/ ___\/ \__/|      " -ForegroundColor Green
    Write-Host "|    \| |\/||      " -ForegroundColor Green
    Write-Host "\___ || |  ||      " -ForegroundColor Green
    Write-Host "\____/\_/  \|      " -ForegroundColor Green
    Write-Host " "
    Write-Host "------------------------------------------------------------------------------------" -ForegroundColor Cyan
    Write-Host "   Kerbal Space Programm DMP Server Manager " -ForegroundColor Blue
    Write-Host "------------------------------------------------------------------------------------`n" -ForegroundColor Cyan
    
}
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function waittimer {
    Start-Sleep -Seconds $scriptspeed
}
#--- Checks -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Check root directory

headlinekspdmp
Write-Host "   Check root directory...`n"
waittimer

if(!(Test-Path $rootgamesrv))                                                                                                                                   # If game server root directory is not present...
{
    headlinekspdmp
    Write-Host $stringrdfoundnot
    waittimer
    
    New-Item -Path $rootgamesrvDIR -Name $rootgamesrvPATH -ItemType "directory"                                                                                 # ...create it...
    
    headlinekspdmp
    $stringrdcreate
    waittimer
}
else
{
    headlinekspdmp
    Write-Host $stringrdfound                                                                                                                                   # ...else write game server root directory is present.
    waittimer 
}
