<#
muss-manager.ps1
.DESCRIPTION

    Max's universal Steam Server - Manager
    
    Sadly there is no standard, so you have to edit some values in Variables


    For server setup - just run the script

    For server management create nee scheduled task
        - Select User: BSP LocalComputer\Users
        - New Trigger: BSP At startup, oder at time
        - Aktion: Start Programm
            * Powershell.exe
            * Arguments: -command .\muss-manager.ps1
            * Start in: Script directory
            * Start only if network is available

https://github.com/thelamescriptkiddiemax/GameServer
#>
#--- Variables ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$steamappid = "443030"                          # Game Server Steam App ID                              EX 443030
$gamename = "ConanExiles"                       # Name of the Game                                      EX Ark
$gameinstance = "01"                            # Instance (Number) of the game server                  EX 01
$gamemods = "880454836,880454836"               # Mods on the Server                                    EX 880454836,880454836


$gamesrvParameter = "-server -log"
                                                # Game server start parameters                          EX MaxPlayers=20?listen?AdminPassword=AdminPW -server -log

$rootgamesrvDIR = "GameServerInstallationen"    # Name of game server directory                         EX GameServers
$rootgamesrvPATH = "C:"                         # Path to the game server directory                     EX C:\stuff\morestuff\
$savegame = "ConanSandbox\Saved"                # Path to the savegames inside the game directory       EX "ConanSandbox\Saved
$saveconfig = "$savegame\Config\WindowsServer"  # Path to the config files inside the game directory    EX $savegame\Config\WindowsServer
$gameEXE = "ConanSandbox\Binaries\Win64\ConanSandboxServer-Win64-Test.exe"             # Path and name of game exe inside game directory       EX ShooterGame\Binaries\Win64\ShooterGameServer.exe

$steamlogin = "anonymous"                       # Steam login name                                      EX anonymous


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

$stringrdfound = [System.String]::Concat("   Root directory ok :D `n   ", $rootgamesrv)
$stringrdfoundnot = [System.String]::Concat("   Root directory not found -,- Create new directory... `n   ", $rootgamesrv)
$stringrdcreate = [System.String]::Concat("   Root directory created! `n   ", $rootgamesrv)
$stringsteamcmdfound = [System.String]::Concat("   SteamCDM directory ok :D  `n   ", $steamCMDdir)
$stringsteamcmdfoundnot = [System.String]::Concat("   SteamCDM directory not found! :/ Create new directory... `n   ", $steamCMDdir)
$stringsteamcmdcreate = [System.String]::Concat("   SteamCDM directorycreated! `n   ", $steamCMDdir, "`n", "   Downloading SteamCMD...")
$stringscmddownload = "   Download and extracting of SteamCMD complete! Zip-file deleted. `n   First run..."
$stringscmdbereit = "   SteamCMD ready!"

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
#--- Checks -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Check root directory
headlinemuss
Write-Host "   Check root directory..."
Start-Sleep -Seconds 2

if(!(Test-Path $rootgamesrv))                                                                                                                                   # If game server root directory is not present...
{
    headlinemuss
    Write-Host $stringrdfoundnot
    Start-Sleep -Seconds 2
    
    New-Item -Path $rootgamesrvDIR -Name $rootgamesrvPATH -ItemType "directory"                                                                                 # ...create it...
    
    headlinemuss
    $stringrdcreate
    Start-Sleep -Seconds 2
}
else
{
    headlinemuss
    Write-Host $stringrdfound                                                                                                                                   # ...else write game server root directory is present.
    Start-Sleep -Seconds 2 
}

# Check SteamCMD

headlinemuss
Write-Host "   Check SteamCMD directory..."
Start-Sleep -Seconds 2

if(!(Test-Path $steamCMDdir))                                                                                                                                   # If SteamCMD directory is not present
{
    headlinemuss
    Write-Host $stringsteamcmdfoundnot
    Start-Sleep -Seconds 2
    
    New-Item -Path $rootgamesrv -Name $steamCMDfolder -ItemType "directory"                                                                                     # ...create SteamCMD directory...
    
    headlinemuss
    $stringsteamcmdcreate
    Start-Sleep -Seconds 2

    Invoke-WebRequest -Uri $steamdownloadlink -OutFile $expandpath                                                                                             # ...download SteamCMD from download link into SteamCMD directory...
    Get-ChildItem $steamCMDdir -Filter *.zip | Expand-Archive -DestinationPath $steamCMDdir -Force
    Remove-Item -Path $steamCMDdir\*.zip      

    
    headlinemuss
    $stringscmddownload
    Start-Sleep -Seconds 2

    Start-Process -FilePath $steamcmd -ArgumentList 'validate +quit' -WindowStyle Hidden                                                                        # ...SteamCMD setup (first run)...
    $steamcmdprocess = Get-Process steamcmd
    Wait-Process -Id $steamcmdprocess.Id                                                                                                                        # ...wait for SteamCMD...

    headlinemuss
    $stringscmdbereit
    Start-Sleep -Seconds 2
}
else 
{
    headlinemuss
    Write-Host $stringsteamcmdfound                                                                                                                             # ...else write SteamCMD found.
    Start-Sleep -Seconds 2
   
}

# Path building

$gameinstancename = [System.String]::Concat("$gamename", "_" ,$gameinstance)
$gameDir = ("$rootgamesrv\$gameinstancename")
$savegameDir = ("$gameDir\$savegame")
$saveconfigDir = ("$gameDir\$saveconfig")
$gameEXEfull = ("$gameDir\$gameEXE")



headlinemuss
Write-Host "   ...preperations completed."
Start-Sleep -Seconds 3


#--- Verarbeitung -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Stopp Server
headlinemuss
Write-Host  "   Check for running server..."

$gameprocess = get-process | Where-Object path -eq $gameEXEfull -ErrorAction SilentlyContinue

if($gameprocess)                                                                                                                                                # If game server is running...
{
    headlinemuss
    Write-Host "   Server is currently running.`n   Stopping Server..."
    Start-Sleep -Seconds 2
    
    Stop-Process -Id $gameprocess.Id                                                                                                                            # ...stopp game server...
    Wait-Process -Id $gameprocess.Id                                                                                                                            # ...and wait for stopp.
    pause
    headlinemuss
    Write-Host "   ...server stopped."
    Start-Sleep -Seconds 2
}
else 
{
    headlinemuss
    Write-Host "   Server is currently not running."                                                                                                            # ...else say that server is not running.
    Start-Sleep -Seconds 2
   
}

# Backup
headlinemuss
Write-Host "   Backups..."
Start-Sleep -Seconds 2

$pfadBackup = ("$rootgamesrv\Backup")
$backupDir = ("$pfadBackup\$gameinstancename")
$backuptime = ((Get-Date).ToString("ddMMyyyy_HHmm"))
$backupDirT = ("$backupDir\$backuptime")
$backupsavegameDir = ("$backupDirT\$buso")
$backupconfigDir = ("$backupDirT\$buco")
$savegameDir = ("$gameDir\$savegame")
$saveconfigDir = ("$gameDir\$saveconfig")




$stringbudone = [System.String]::Concat("`n   BACKUPS DONE! `n   Savegame: ", $backupsavegameDir, "`n   Config: ", $backupconfigDir)


# If BackupDir not present create it
if(!(Test-Path $backupDir))                                                                                                                                 # ...check if backup directory is present...
    {
        New-Item -Path $pfadBackup -Name $gameinstancename -ItemType "directory"                                                                                # ...create if not...
        $stringnewbudir = [System.String]::Concat("   Created new backup directory `n   ", $backupDir)

        headlinemuss
        Write-Host $stringnewbudir
        Start-Sleep -Seconds 2
    }

$stringbackup = [System.String]::Concat("   Starting backup... `n   ", $savegameDir, " to ", $backupsavegameDir, "`n   ", $saveconfigDir, " to ", $backupconfigDir)

# If SavegameDir contains files backup them
if(Test-Path $savegameDir)                                                                                                                                      # If savegame directory is present...
{
    headlinemuss
    Write-Host $stringbackup
    Start-Sleep -Seconds 4



    New-Item -Path $backupDir -Name $backuptime -ItemType "directory"                                                                                           # ...then create directory with time stamp...
    New-Item -Path $backupDirT -Name $buso -ItemType "directory"                                                                                                # ...create inside timestamp savegame directory...
    
    Copy-Item -Path $savegameDir -Destination $backupsavegameDir -Recurse                                                                                       # ...copy savegame to savegame backup...
    
    headlinemuss
    $stringbudone
    Start-Sleep -Seconds 4

}
else 
{
    headlinemuss
    Write-Host "   No savegames to backup..."                                                                                                                        # ...else write noothing to backup.
    Start-Sleep -Seconds 2
   
}



# If ConfigDir contains files backup them
if(Test-Path $saveconfig)                                                                                                                                      # If savegame directory is present...
{
    headlinemuss
    Write-Host $stringbackup
    Start-Sleep -Seconds 4

    # If backupDir\gameinstance\timestamp is not present create it
    if (!(Test-Path $backupDirT)) {
        New-Item -Path $backupDir -Name $backuptime -ItemType "directory"
    }

    New-Item -Path $backupDirT -Name $buco -ItemType "directory"                                                                                                # ...create inside timestamp savegame directory...

    Copy-Item -Path $saveconfig -Destination $backupconfigDir -Recurse                                                                                          # ...copy config to config backup...

    headlinemuss
    $stringbudone
    Start-Sleep -Seconds 4

}
else 
{
    headlinemuss
    Write-Host "   No config files to backup..."                                                                                                                        # ...else write noothing to backup.
    Start-Sleep -Seconds 2
   
}

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Setup
headlinemuss
Write-Host "   Server setup..."
Start-Sleep -Seconds 2

$argumentlist1 = "+login $steamlogin +force_install_dir $gameDir +app_update $steamappid +validate +quit"

Start-Process -FilePath $steamcmd -ArgumentList $argumentlist1                                                             # Download and install server files in SteamCMD
$steamcmdprocess = Get-Process steamcmd
Wait-Process -Id $steamcmdprocess.Id                                                                                                                            # Wait for SteamCMD

headlinemuss
Write-Host "   ...server setup done!"
Start-Sleep -Seconds 2

if ($gamemods)                                                                                                                                                  # If mod-variable is set...
    {
    
        headlinemuss
        Write-Host "   Mod setup..."
        Start-Sleep -Seconds 2

        foreach ($gamemod in $gamemods)
        {
            $argumentlist2 = "+login $steamlogin +workshop_download_item $steamappid $gamemod +validate +quit"
            
            Start-Process -FilePath $steamcmd -ArgumentList $argumentlist2                                                         # ...download and install mod files in SteamCMD for each mod
            $steamcmdprocess = Get-Process steamcmd
            Wait-Process -Id $steamcmdprocess.Id                                                                                                                # ...and wait for SteamCMD...
        }

        headlinemuss
        Write-Host "   ...mod setup done"
        Start-Sleep -Seconds 2
    }
    else 
    {
    headlinemuss
    Write-Host "   ...no mods selected..."                                                                                                                      # ...else write no mods selected.
    Start-Sleep -Seconds 2
    }

if (Test-Path $backupDir)                                                                                                                                       # If backup directory contains files...
    {
    headlinemuss
    Write-Host "   Rewrite confing..."
    Start-Sleep -Seconds 2
    
    $rewriteconf = Get-ChildItem -Path $backupDir -Directory | Sort-Object LastAccessTime -Descending | Select-Object -Skip 1 -First 1 -ExpandProperty name     # ...find second youngest directory...
    Copy-Item -Path $backupDir\$rewriteconf -Destination $saveconfig -Recurse                                                                                   # ...copy config backup from it to config directory.

    headlinemuss
    Write-Host "   ...config restored!"
    Start-Sleep -Seconds 2
    }

# Start Server
headlinemuss
Write-Host "   Starting game server..."
Start-Process -FilePath $gameEXEfull -ArgumentList $gamesrvParameter                                                                                                                               # Start game server


#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#stop-process -Id $PID                                                                                                                                           # Close script

