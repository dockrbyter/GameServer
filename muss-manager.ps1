<#
muss-manager.ps1
.DESCRIPTION

    Max's universal Steam Server - Manager
    
    It's recomendet to create a copy of this script for each game server you
    want to run. EX muss-manager_ARK01.ps1, muss-manager_ARK02.ps1, muss-manager_CSGO01.ps1, ...

    Just edit the variables in lines 82 to 98
        82 - 82 SERVERSETTINGS
        Edit these values in each copy of the script for the corresponding game
        96 - 98
        Edit these values one time and keep them in each copy

    You may have to tweak the parameters for SteamCMD and server start. You find them on the following lines:
        355  Server Setuo   $argumentlist1
        374  Mod Setuo      $argumentlist2
        87  Server Start    $gamesrvParameter

    For server setup / launch - just run the script

    For server management create new scheduled task
        - Select User: EX LocalComputer\Users
        - New Trigger: EX At startup, oder at time
        - Aktion: Start Programm
            * Powershell.exe
            * Arguments: -command .\muss-manager.ps1
            * Start in: Script directory
        - Start only if network is available


    *** EXAMPLES ** YOUR CONFIG SHOULD LOOK LIKE THIS ********************************************************************************************************************
    Conan Exiles:
        $steamappid = "376030"
        $gamename = "ConanExiles"
        $gameinstance = "01"
        $gamemods = "880454836"
        $steamlogin = "anonymous"
        $gamesrvParameter = "-server -log"

        $savegame = "ConanSandbox\Saved"
        $saveconfig = "$savegame\Config\WindowsServer"
        $gameEXE = "ConanSandbox\Binaries\Win64\ConanSandboxServer-Win64-Test.exe"


    Ark Sruvival Evolved:
        $steamappid = "443030"
        $gamename = "ark"
        $gameinstance = "theisland"
        $gamemods = ""
        $steamlogin = "anonymous"
        $gamesrvParameter = "TheIsland?SessionName=MUSS-Ark-01?ServerPassword=sudo?ServerAdminPassword=cR4p?MaxPlayers=10 -server -log"

        $savegame = "ShooterGame\Saved"
        $saveconfig = "$savegame\Config\WindowsServer"
        $gameEXE = "ShooterGame\Binaries\Win64\ShooterGameServer.exe"


    Counter-Strike Global Offensive:
        $steamappid = "740"
        $gamename = "csgo"
        $gameinstance = "01"
        $gamemods = ""
        $steamlogin = "YourSteamAccount"
        $gamesrvParameter = "srcds -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map de_dust2 +sv_setsteamaccount YourAuthToken"

        $savegame = ""
        $saveconfig = "$rootgamesrv"
        $gameEXE = "$steamcmd"


Steam Game Server Account Management:
(to generate server auth tokens for games like csgo)
https://steamcommunity.com/dev/managegameservers


https://github.com/thelamescriptkiddiemax/GameServer
#>
#--- Variables ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# SERVERSETTINGS
$steamappid = "443030"                          # Game Server Steam App ID                              EX 443030
$gamename = "ConanExiles"                       # Name of the Game                                      EX Ark
$gameinstance = "01"                            # Instance (Number) of the game server                  EX 01
$gamemods = "880454836"                         # Mods on the Server                                    EX 880454836,880454836
$steamlogin = "anonymous"                       # Steam login name                                      EX anonymous
$gamesrvParameter = "-server -log"
                                                # Game server start parameters                          EX MaxPlayers=20?listen?AdminPassword=AdminPW -server -log

$savegame = "ConanSandbox\Saved"                # Path to the savegames inside the game directory       EX "ConanSandbox\Saved
$saveconfig = "$savegame\Config\WindowsServer"  # Path to the config files inside the game directory    EX $savegame\Config\WindowsServer
$gameEXE = "ConanSandbox\Binaries\Win64\ConanSandboxServer-Win64-Test.exe"             # Path and name of game exe inside game directory       EX ShooterGame\Binaries\Win64\ShooterGameServer.exe
                                                

# SCRIPTSETTINGS
$rootgamesrvPATH = "C:"                         # Path to the game server directory                     EX C:\stuff\morestuff\
$rootgamesrvDIR = "GameServerInstallationen"    # Name of game server directory                         EX GameServers
$scriptspeed = "2"                              # Timespan to show messages in Seconds                  EX 2


#--- Vorbereitung -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$stringhost = [System.String]::Concat("[ ", $env:UserName, " @ ", $env:computername, " @ ", ((Get-WmiObject Win32_ComputerSystem).Domain), " ", (Get-CimInstance Win32_OperatingSystem | Select-Object Caption), ": ", 
((Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\" -Name ReleaseID).ReleaseId), " ]   ", (Get-Date -Format "dd/MM/yyyy HH:mm"), "`n", "[ ", $MyInvocation.MyCommand.Name, " ]", "`n","`n") 
$stringhost = $stringhost.replace("{Caption=Microsoft"," ").replace("}", " ")

$steamdownloadlink = "http://media.steampowered.com/installer/steamcmd.zip"

$steamCMDfolder = "SteamCMD"
$buso = "savegame"
$buco = "config"
$downloadfile = "steamcmd.zip"
$rootgamesrv = ("$rootgamesrvPATH\$rootgamesrvDIR")
$steamCMDdir = ("$rootgamesrv\$steamCMDfolder")
$steamcmd = ("$steamCMDdir\steamcmd.exe")
$expandpath = ("$steamCMDdir\$downloadfile")

$stringrdfound = [System.String]::Concat("   Root directory ok :D `n   ", $rootgamesrv, "`n")
$stringrdfoundnot = [System.String]::Concat("   Root directory not found -,- Create new directory... `n   ", $rootgamesrv, "`n")
$stringrdcreate = [System.String]::Concat("   Root directory created! `n   ", $rootgamesrv, "`n")
$stringsteamcmdfound = [System.String]::Concat("   SteamCDM directory ok :D  `n   ", $steamCMDdir, "`n")
$stringsteamcmdfoundnot = [System.String]::Concat("   SteamCDM directory not found! :/ Create new directory... `n   ", $steamCMDdir, "`n")
$stringsteamcmdcreate = [System.String]::Concat("   SteamCDM directorycreated! `n   ", $steamCMDdir, "`n", "     SteamCMD Download & Setup...`n     Please wait.. `n")
$stringscmddownload = "   Download and extracting of SteamCMD complete! Zip-file deleted. `n   First run...`n"
$stringscmdbereit = "   SteamCMD ready!`n"



$Host.UI.RawUI.BackgroundColor = 'DarkGray'                                                                                                                      # Script Hintergrundfarbe
$Host.UI.RawUI.ForegroundColor = 'White'                                                                                                                       # Script Textfarbe

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function headlinemuss {                                                                                                                                         # Show Headline

    #Clear-Host
    Write-Host $stringhost -ForegroundColor Magenta
    Write-Host "    _  _  _  _  ____  ____                   " -ForegroundColor DarkRed
    Write-Host "   ( \/ )/ )( \/ ___)/ ___)  ___             " -ForegroundColor DarkRed
    Write-Host "   / \/ \) \/ (\___ \\___ \ (___)            " -ForegroundColor DarkRed
    Write-Host "   \_)(_/\____/(____/(____/                  " -ForegroundColor DarkRed
    Write-Host "    _  _   __   __ _   __    ___  ____  ____ " -ForegroundColor DarkRed
    Write-Host "   ( \/ ) / _\ (  ( \ / _\  / __)(  __)(  _ \" -ForegroundColor DarkRed
    Write-Host "   / \/ \/    \/    //    \( (_ \ ) _)  )   /" -ForegroundColor DarkRed
    Write-Host "   \_)(_/\_/\_/\_)__)\_/\_/ \___/(____)(__\_)" -ForegroundColor DarkRed
    Write-Host " "
    Write-Host "------------------------------------------------------------------------------------" -ForegroundColor Cyan
    Write-Host "   Max's universal Steam Server - Manager " -ForegroundColor Green
    Write-Host "------------------------------------------------------------------------------------`n" -ForegroundColor Cyan
    
}
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function waittimer {
    Start-Sleep -Seconds $scriptspeed
}
#--- Checks -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Check root directory
headlinemuss
Write-Host "   Check root directory...`n"
waittimer

if(!(Test-Path $rootgamesrv))                                                                                                                                   # If game server root directory is not present...
{
    headlinemuss
    Write-Host $stringrdfoundnot
    waittimer
    
    New-Item -Path $rootgamesrvDIR -Name $rootgamesrvPATH -ItemType "directory"                                                                                 # ...create it...
    
    headlinemuss
    $stringrdcreate
    waittimer
}
else
{
    headlinemuss
    Write-Host $stringrdfound                                                                                                                                   # ...else write game server root directory is present.
    waittimer 
}

# Check SteamCMD
headlinemuss
Write-Host "   Check SteamCMD directory...`n"
waittimer

if(!(Test-Path $steamCMDdir))                                                                                                                                   # If SteamCMD directory is not present
{
    headlinemuss
    Write-Host $stringsteamcmdfoundnot
    waittimer
    
    New-Item -Path $rootgamesrv -Name $steamCMDfolder -ItemType "directory"                                                                                     # ...create SteamCMD directory...
    
    headlinemuss
    $stringsteamcmdcreate
    waittimer

    Invoke-WebRequest -Uri $steamdownloadlink -OutFile $expandpath                                                                                             # ...download SteamCMD from download link into SteamCMD directory...
    Get-ChildItem $steamCMDdir -Filter *.zip | Expand-Archive -DestinationPath $steamCMDdir -Force
    Remove-Item -Path $steamCMDdir\*.zip      

    
    headlinemuss
    $stringscmddownload
    waittimer

    Start-Process -FilePath $steamcmd -ArgumentList 'validate +quit' -WindowStyle Hidden                                                                        # ...SteamCMD setup (first run)...
    $steamcmdprocess = Get-Process steamcmd
    Wait-Process -Id $steamcmdprocess.Id                                                                                                                        # ...wait for SteamCMD...

    headlinemuss
    $stringscmdbereit
    waittimer
}
else 
{
    headlinemuss
    Write-Host $stringsteamcmdfound                                                                                                                             # ...else write SteamCMD found.
    waittimer
   
}

# Path building
$gameinstancename = [System.String]::Concat("$gamename", "_" ,$gameinstance)
$gameDir = ("$rootgamesrv\$gameinstancename")
$savegameDir = ("$gameDir\$savegame")
$saveconfigDir = ("$gameDir\$saveconfig")
$gameEXEfull = ("$gameDir\$gameEXE")

headlinemuss
Write-Host "   ...preperations completed.`n"
waittimer


#--- Verarbeitung -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Stopp Server
headlinemuss
Write-Host  "   Check for running server..."
waittimer

$gameprocess = get-process | Where-Object path -eq $gameEXEfull -ErrorAction SilentlyContinue

if($gameprocess)                                                                                                                                                # If game server is running...
{
    headlinemuss
    Write-Host "   Server is currently running.`n   Stopping Server...`n"
    waittimer
    
    Stop-Process -Id $gameprocess.Id                                                                                                                            # ...stopp game server...
    Wait-Process -Id $gameprocess.Id                                                                                                                            # ...and wait for stopp.

    headlinemuss
    Write-Host "   ...server stopped.`n"
    waittimer
}
else 
{
    headlinemuss
    Write-Host "   Server is currently not running.`n"                                                                                                            # ...else say that server is not running.
    waittimer
   
}

# Backup
headlinemuss
Write-Host "   Preparing Backups...`n"
waittimer

$pfadBackup = ("$rootgamesrv\Backup")
$backupDir = ("$pfadBackup\$gameinstancename")
$backuptime = ((Get-Date).ToString("ddMMyyyy_HHmm"))
$backupDirT = ("$backupDir\$backuptime")
$backupsavegameDir = ("$backupDirT\$buso")
$backupconfigDir = ("$backupDirT\$buco")
$savegameDir = ("$gameDir\$savegame")
$saveconfigDir = ("$gameDir\$saveconfig")
$stringbudone1 = [System.String]::Concat("`n   SAVEGAME BACKUP DONE! `n   Savegame: ", $backupsavegameDir, "`n")
$stringbudone2 = [System.String]::Concat("`n   CONFIG BACKUP DONE! `n   Config: ", $backupconfigDir, "`n")
$stringbackup1 = [System.String]::Concat("   Starting backup... `n   ", $savegameDir, "`n to `n", $backupsavegameDir, "`n")
$stringbackup2 = [System.String]::Concat("   Starting backup... `n   ", $saveconfigDir, "`n to `n", $backupconfigDir, "`n")

# If BackupDir not present create it
if(!(Test-Path $backupDir))                                                                                                                                 # ...check if backup directory is present...
    {
        New-Item -Path $pfadBackup -Name $gameinstancename -ItemType "directory"                                                                                # ...create if not...
        $stringnewbudir = [System.String]::Concat("   Created new backup directory `n   ", $backupDir, "`n")

        headlinemuss
        Write-Host $stringnewbudir
        waittimer
    }


# If SavegameDir contains files backup them
if(Test-Path $savegameDir)                                                                                                                                      # If savegame directory is present...
{
    headlinemuss
    Write-Host $stringbackup1
    waittimer

    New-Item -Path $backupDir -Name $backuptime -ItemType "directory" | Out-Null                                                                                           # ...then create directory with time stamp...
    New-Item -Path $backupDirT -Name $buso -ItemType "directory" | Out-Null                                                                                                # ...create inside timestamp savegame directory...
    
    Copy-Item -Path $savegameDir -Destination $backupsavegameDir | Out-Null                                                                                       # ...copy savegame to savegame backup...
    
    headlinemuss
    $stringbudone1
    waittimer

}
else 
{
    headlinemuss
    Write-Host "   No savegames to backup...`n"                                                                                                                        # ...else write noothing to backup.
    waittimer
   
}

# If ConfigDir contains files backup them
if(Test-Path $saveconfig)                                                                                                                                      # If savegame directory is present...
{
    headlinemuss
    Write-Host $stringbackup2
    waittimer

    # If backupDir\gameinstance\timestamp is not present create it
    if (!(Test-Path $backupDirT)) {
        New-Item -Path $backupDir -Name $backuptime -ItemType "directory" | Out-Null
    }

    New-Item -Path $backupDirT -Name $buco -ItemType "directory" | Out-Null                                                                                                # ...create inside timestamp savegame directory...

    Copy-Item -Path $saveconfig -Destination $backupconfigDir | Out-Null                                                                                          # ...copy config to config backup...

    headlinemuss
    $stringbudone2
    waittimer

}
else 
{
    headlinemuss
    Write-Host "   No config files to backup...`n"                                                                                                                        # ...else write noothing to backup.
    waittimer
   
}

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Setup
headlinemuss
Write-Host "   Server setup...`n   ...please wait...`n"
waittimer

$argumentlist1 = "+login $steamlogin +force_install_dir $gameDir +app_update $steamappid +validate +quit"

Start-Process -FilePath $steamcmd -ArgumentList $argumentlist1                                                             # Download and install server files in SteamCMD
$steamcmdprocess = Get-Process steamcmd
Wait-Process -Id $steamcmdprocess.Id                                                                                                                            # Wait for SteamCMD

headlinemuss
Write-Host "   ...server setup done!`n"
waittimer

if ($gamemods)                                                                                                                                                  # If mod-variable is set...
    {
    
        headlinemuss
        Write-Host "   Mod setup...`n"
        waittimer

        foreach ($gamemod in $gamemods)
        {
            $argumentlist2 = "+login $steamlogin +workshop_download_item $steamappid $gamemod +validate +quit"
            
            Start-Process -FilePath $steamcmd -ArgumentList $argumentlist2                                                         # ...download and install mod files in SteamCMD for each mod
            $steamcmdprocess = Get-Process steamcmd
            Wait-Process -Id $steamcmdprocess.Id                                                                                                                # ...and wait for SteamCMD...
        }

        headlinemuss
        Write-Host "   ...mod setup done`n"
        waittimer
    }
    else 
    {
    headlinemuss
    Write-Host "   ...no mods selected...`n"                                                                                                                      # ...else write no mods selected.
    waittimer
    }

if (Test-Path $backupDir)                                                                                                                                       # If backup directory contains files...
    {
    headlinemuss
    Write-Host "   Rewrite confing...`n"
    waittimer
    
    $rewriteconf = Get-ChildItem -Path $backupDir -Directory | Sort-Object LastAccessTime -Descending | Select-Object -First 1 -ExpandProperty name     # ...find second youngest directory...
    Copy-Item -Path $backupDir\$rewriteconf -Destination $saveconfig -Recurse                                                                                   # ...copy config backup from it to config directory.

    headlinemuss
    Write-Host "   ...config restored!`n"
    waittimer
    }

# Start Server
headlinemuss
Write-Host "   Starting game server...`n"
Start-Process -FilePath $gameEXEfull -ArgumentList $gamesrvParameter                                                                                                                               # Start game server
waittimer

headlinemuss
Write-Host "   Server starts up now! `n   Should be availiable in a few Minutes...`n`n Exit MUSS-Manager...`n`n`n`n"
waittimer

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#stop-process -Id $PID                                                                                                                                           # Close script

