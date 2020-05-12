<#
KerbalSpaceProgram-DMP-SM.ps1
.DESCRIPTION

    KerbalSpaceProgram DMP Server-Manager

    A script to setup and maintin a Kerbal Spaceprogram Server,
    based on the great DarkMultiplayer.

    Checkout their website: https://d-mp.org


    Edit the values in lines 30 to 38 corresponding to your environment

    For server setup / launch - just run the script

    For server management create new scheduled task
        - Select User: EX LocalComputer\Users
        - New Trigger: EX At startup, oder at time
        - Aktion: Start Programm
            * Powershell.exe
            * Arguments: -command .\KerbalSpaceProgram-DMP-SM.ps1
            * Start in: Script directory EX C:\GameServer
        - Start only if network is available


https://github.com/thelamescriptkiddiemax/GameServer
#>
#--- Variables ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# SERVERSETTINGS
$gamename = "KerbalSpaceProgram"                            # Name of the Game                                      EX KerbalSpaceProgram
$gameinstance = "01"                                        # Instance (Number) of the game server                  EX 01

# SCRIPTSETTINGS
$rootgamesrvPATH = "C:"                                     # Path to the game server directory                     EX C:\stuff\morestuff\
$rootgamesrvDIR = "GameServer"                              # Name of game server directory                         EX GameServer
$scriptspeed = "4"                                          # Timespan to show messages in Seconds                  EX 2
$updatetime = "10"                                          # Timespan to wait for updates in Seconds               EX 10


#--- Vorbereitung -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$stringhost = [System.String]::Concat("[ ", $env:UserName, " @ ", $env:computername, " @ ", ((Get-WmiObject Win32_ComputerSystem).Domain), " ", (Get-CimInstance Win32_OperatingSystem | Select-Object Caption), ": ", 
((Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\" -Name ReleaseID).ReleaseId), " ]   ", (Get-Date -Format "dd/MM/yyyy HH:mm"), "`n", "[ ", $MyInvocation.MyCommand.Name, " ]", "`n","`n") 
$stringhost = $stringhost.replace("{Caption=Microsoft"," ").replace("}", " ")

$dllServer = "https://d-mp.org/builds/release/v0.3.5.3/DMPServer.zip"
$dllUpdater = "https://d-mp.org/builds/updater/DMPUpdater.exe"

$gameconfigFolder = "Config"
$savegameFolder = "Universe"
$gameEXEname = "DMPServer.exe"
$updateEXEname = "DMPUpdater.exe"
$rootgamesrv = ("$rootgamesrvPATH\$rootgamesrvDIR")
$gameinstancename = [System.String]::Concat("$gamename", "_" ,$gameinstance)
$gameinstanceDIR = ("$rootgamesrv\$gameinstancename")
$gameconfigDIR = ("$gameinstanceDIR\$gameconfigFolder\*")
$savegameDIR = ("$gameinstanceDIR\$savegameFolder\*")
$gameEXE = ("$gameinstancename\$gameEXEname")
$updateEXE = ("$gameinstancename\$updateEXEname")
$dlfileServer = "DMPServer.zip"
$dlfileUpdater = $updateEXEname
$expandpath1 = ("$gameinstanceDIR\$dlfileServer")
$expandpath2 = ("$gameinstanceDIR\$dlfileUpdater")
$pfadBackup = ("$rootgamesrv\Backup")






$stringrdfound = [System.String]::Concat("`n   Root directory ok :D `n   ", $rootgamesrv, "`n")
$stringrdfoundnot = [System.String]::Concat("`n   Root directory not found -,- Create new directory... `n   ", $rootgamesrv, "`n")
$stringrdcreate = [System.String]::Concat("`n   Root directory created! `n   ", $rootgamesrv, "`n")
$stringupdate = [System.String]::Concat("`n   Updating... Delay: ", $updatetime, " Seconds `n")

$Host.UI.RawUI.BackgroundColor = 'DarkGray'
$Host.UI.RawUI.ForegroundColor = 'White'


#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function headlinekspdmp {

    Clear-Host
    Write-Host $stringhost -ForegroundColor Magenta
    Write-Host "      _  __ ____  ____  " -ForegroundColor Green
    Write-Host "     / |/ // ___\/  __\ " -ForegroundColor Green
    Write-Host "     |   / |    \|  \/| " -ForegroundColor Green
    Write-Host "     |   \ \___ ||  __/ " -ForegroundColor Green
    Write-Host "     \_|\_\\____/\_/    " -ForegroundColor Green
    Write-Host " "
    Write-Host "      ____  _      ____ " -ForegroundColor Green
    Write-Host "     /  _ \/ \__/|/  __\" -ForegroundColor Green
    Write-Host "     | | \|| |\/|||  \/|" -ForegroundColor Green
    Write-Host "     | |_/|| |  |||  __/" -ForegroundColor Green
    Write-Host "     \____/\_/  \|\_/   " -ForegroundColor Green
    Write-Host " "
    Write-Host "      ____  _           " -ForegroundColor Green
    Write-Host "     / ___\/ \__/|      " -ForegroundColor Green
    Write-Host "     |    \| |\/||      " -ForegroundColor Green
    Write-Host "     \___ || |  ||      " -ForegroundColor Green
    Write-Host "     \____/\_/  \|      " -ForegroundColor Green
    Write-Host " "
    Write-Host "------------------------------------------------------------------------------------" -ForegroundColor Cyan
    Write-Host "   Kerbal Space Program DMP Server Manager " -ForegroundColor Blue
    Write-Host "------------------------------------------------------------------------------------`n" -ForegroundColor Cyan
    
}
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function waittimer {
    Start-Sleep -Seconds $scriptspeed
}
#--- Checks -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Check root directory
headlinekspdmp
Write-Host "`n   Check root directory...`n"
waittimer

if(!(Test-Path $rootgamesrv))                                                                                               # If game server root directory is not present...
{
    headlinekspdmp
    Write-Host $stringrdfoundnot
    waittimer
    
    New-Item -Path $rootgamesrvDIR -Name $rootgamesrvPATH -ItemType "directory" | Out-Null                                             # ...create it...
    
    headlinekspdmp
    $stringrdcreate
    waittimer
}
else
{
    headlinekspdmp
    Write-Host $stringrdfound                                                                                               # ...else write game server root directory is present.
    waittimer 
}

# Check game server directory
headlinekspdmp
Write-Host "`n   Check game server directory...`n"
waittimer

if(!(Test-Path $gameinstanceDIR))                                                                                           # If game server root directory is not present...
{
    headlinekspdmp
    Write-Host "`n   Game server directory not found! `n   Create directory and download KSP-DMP... `n"
    waittimer
    
    New-Item -Path $rootgamesrv -Name $gameinstancename -ItemType "directory" | Out-Null                                              # ...create it...
    
    headlinekspdmp
    Write-Host "`n   Directory created! Downloading KSP-DMP... `n"
    waittimer

    Invoke-WebRequest -Uri $dllServer -OutFile $expandpath1
    Invoke-WebRequest -Uri $dllUpdater -OutFile $expandpath2
    Get-ChildItem $gameinstanceDIR -Filter *.zip | Expand-Archive -DestinationPath $gameinstanceDIR -Force
    
    Get-ChildItem -Path $gameinstanceDIR\DMPServer -Recurse -File | Move-Item -Destination $gameinstanceDIR
    Remove-Item $gameinstanceDIR\DMPServer -Recurse
    Remove-Item -Path $gameinstanceDIR\*.zip

    headlinekspdmp
    Write-Host "`n   Downloads complete! First run... `n"
    waittimer
    
    Start-Process -FilePath $gameEXE -WindowStyle Hidden
    $gameprocess = (Get-Process -Name "*DMPServer*").Name
    Start-Sleep -Seconds 5
    Stop-Process -Name $gameprocess                                                                                        # ...stopp game server...
    Wait-Process -Name $gameprocess                                                                                        # ...and wait for stopp.
    
}
else
{
    headlinekspdmp
    Write-Host "`n   Game server directory found! `n   Check status... `n"                                                    # ...else write game server root directory is present.
    waittimer 
}


#--- Verarbeitung -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Stopp Server
headlinekspdmp
Write-Host  "`n   Check for running server... `n"
waittimer

$gameprocess = (Get-Process -Name "*DMPServer*").Name

if($gameprocess)                                                                                                            # If game server is running...
{
    headlinekspdmp
    Write-Host "`n   Server is currently running.`n   Stopping Server...`n"
    waittimer
    
    Stop-Process -Name $gameprocess                                                                                        # ...stopp game server...
    Wait-Process -Name $gameprocess                                                                                        # ...and wait for stopp.

    headlinekspdmp
    Write-Host "`n   ...server stopped.`n"
    waittimer
}
else 
{
    headlinekspdmp
    Write-Host "`n   Server is currently not running.`n"                                                                      # ...else say that server is not running.
    waittimer
   
}

# Backup
headlinekspdmp
Write-Host "`n   Preparing Backups...`n"
waittimer

$backuptime = ((Get-Date).ToString("ddMMyyyy_HHmm"))
$pfadBackupGame = ("$pfadBackup\$gameinstancename")
$pfadBackupNOW = ("$pfadBackupGame\$backuptime")
$backupConfigDIR = ("$pfadBackupNOW\$gameconfigFolder")
$backuSavegameDIR = ("$pfadBackupNOW\$savegameFolder")

$stringbudirnot = [System.String]::Concat("`n   Backup directory not fond! `n   Creating: ", $pfadBackup, "`n")
$stringbackupheute = [System.String]::Concat("`n   Creating: `n   ", $pfadBackupNOW, "...`n   ", $backupConfigDIR, "...`n   ", $backuSavegameDIR, "`n")

# Check Backup Directory
if(!(Test-Path $pfadBackup))
{
    headlinekspdmp
    Write-Host $stringbudirnot
    waittimer
    
    New-Item -Path $rootgamesrvDIR -Name $rootgamesrvPATH -ItemType "directory" | Out-Null
    
    headlinekspdmp
    $stringrdcreate
    waittimer
}
else
{
    headlinekspdmp
    Write-Host "`n   Backup directory found...`n"
    waittimer 
}

# Check Backup Game Directory
if(!(Test-Path $pfadBackupGame))
{
    headlinekspdmp
    Write-Host "`n   Backup gameinstance directory not found! Creating..."
    waittimer
    
    New-Item -Path $pfadBackup -Name $gameinstancename -ItemType "directory" | Out-Null
    
    headlinekspdmp
    Write-Host "`n   Backup gameinstance directory created!`n"
    waittimer
}
else
{
    headlinekspdmp
    Write-Host "`n   Backup gameinstance directory found :D`n"
    waittimer 
}

headlinekspdmp
Write-Host $stringbackupheute
waittimer

New-Item -Path $pfadBackupGame -Name $backuptime -ItemType "directory" | Out-Null
New-Item -Path $pfadBackupNOW -Name $gameconfigFolder -ItemType "directory" | Out-Null
New-Item -Path $pfadBackupNOW -Name $savegameFolder -ItemType "directory" | Out-Null

headlinekspdmp
Write-Host "`n   ...done! Copy files...`n"
waittimer

Copy-Item -Path $gameconfigDIR -Recurse -Destination $backupConfigDIR | Out-Null
Copy-Item -Path $savegameDIR -Recurse -Destination $backuSavegameDIR | Out-Null

headlinekspdmp
Write-Host "`n   ...Backups done! `n"
waittimer

# Updates
headlinekspdmp
$stringupdate
Start-Process -FilePath $updateEXE
Start-Sleep -Seconds $updatetime
Stop-Process -Name "*DMPUpdater*"

headlinekspdmp
Write-Host "`n   ...Updates done! `n"
waittimer

# Start Server
headlinekspdmp
Write-Host "`n   Starting game server...`n"
Start-Process -FilePath $gameEXE
waittimer

headlinekspdmp
Write-Host "`n   Server starts up now! `n   Should be availiable in a few Seconds...`n`n Exit KerbalSpaceProgram-DMP-SM...`n`n`n`n"
waittimer

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

stop-process -Id $PID                                                                                                  # Close script


