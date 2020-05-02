<#
muss-manager.ps1
.DESCRIPTION

    Max's universal Steam Server - Manager
    
    Edit the values in Variablen

    For server setup - junst run the script

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
#--- Variablen ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$steamappid = "443030"              # Game Server Steam App ID              BSP 443030
$gameinstance = "01"                # Instance (Number) of the game server  BSP 01
$gamemods = "880454836,880454836"   # Mods on the Server                    BSP 880454836,880454836


$gamesrvParameter = "-server -log"
# Game server start parameters BSP MaxPlayers=20?listen?AdminPassword=AdminPW -server -log


$rootgamesrvDIR = "GameServerInstallationen"    # Name of game server directory BSP GameServers
$rootgamesrvPATH = "C:"                         # Path to the game server directory BSP C:\stuff\morestuff\
$savegame = "ConanSandbox\Saved"                # Path to the savegames inside the game directory
$saveconfig = "$savegame\Config\WindowsServer"  # Path to the config files inside the game directory
$gameEXE = "ConanSandboxServer.exe"             # Path and name of game exe inside game directory BSP ShooterGame\Binaries\Win64\ShooterGameServer.exe

$pfadBackup = "$rootgamesrv\Backup"             # Path to the backups

$steamlogin = "anonymous"   # Steam login name BSP anonymous


#--- Vorbereitung -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$stringhost = [System.String]::Concat("[ ", $env:UserName, " @ ", $env:computername, " @ ", ((Get-WmiObject Win32_ComputerSystem).Domain), " ", (Get-CimInstance Win32_OperatingSystem | Select-Object Caption), ": ", 
((Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\" -Name ReleaseID).ReleaseId), " ]   ", (Get-Date -Format "dd/MM/yyyy HH:mm:ss"), "`n", "[ ", $MyInvocation.MyCommand.Name, " ]", "`n","`n") 
$stringhost = $stringhost.replace("{Caption=Microsoft"," ").replace("}", " ")

$steamdownloadlink = "http://media.steampowered.com/installer/steamcmd.zip"

$steamCMDfolder = "SteamCMD"
$buso = "savegame"
$buco = "config"
$rootgamesrv = ("$rootgamesrvPATH\$rootgamesrvDIR")
$steamCMDdir = ("$rootgamesrv\$steamCMDfolder")
$steamcmd = ("$steamCMDdir\steamcmd.exe")
$gamename = $gamename | Select-String -Pattern "name" | Select-Object -First 1
$gamename = $gamename.P3
$gamename = $gamename.Replace("`"","")
$gameinstancename = [System.String]::Concat("$gamename", "_" ,$gameinstance)
$gameDir = ("$rootgamesrv\$gameinstancename")
$savegameDir = ("$gameDir\$savegame")
$saveconfigDir = ("$gameDir\$saveconfig")
$gameEXEfull = ("$gameDir\$gameEXE")
$backupDir = ("$pfadBackup\$gameinstancename")
$backupDirT = ("$backupDir\$backuptime")
$backupsavegameDir = ("$backupDirT\$buso")
$backupconfigDir = ("$backupDirT\$buco")

$gameprocess = get-process | Where-Object path -eq $gameEXEfull -ErrorAction SilentlyContinue
$steamcmdprocess = Get-Process steamcmd
$gamename = &.\$steamcmd +app_info_print $steamappid +quit
$backuptime = (Get-Date -Format "dd.MM.yyyy_HH:mm")

$stringrdfound = [System.String]::Concat("   Root directory ok :D `n   ", $rootgamesrv)
$stringrdfoundnot = [System.String]::Concat("   Root directory not found -,- Create new directory... `n   ", $rootgamesrv)
$stringrdcreate = [System.String]::Concat("   Root directory created! `n   ", $rootgamesrv)
$stringsteamcmdfound = [System.String]::Concat("   SteamCDM directory ok :D  `n   ", $steamCMDdir)
$stringsteamcmdfoundnot = [System.String]::Concat("   SteamCDM directory not found! :/ Create new directory... `n   ", $steamCMDdir)
$stringsteamcmdcreate = [System.String]::Concat("   SteamCDM directorycreated! `n   ", $steamCMDdir, "`n", "   Downloading SteamCMD...")
$stringscmddownload = "   Download and extracting of SteamCMD complete! Zip-file deleted. `n   First run..."
$stringscmdbereit = "   SteamCMD ready!"
$stringbackup = [System.String]::Concat("   Starting backup... `n   ", $savegameDir, " to ", $backupsavegameDir, "`n   ", $saveconfigDir, " to ", $backupconfigDir)
$stringnewbudir = [System.String]::Concat("   Created new backup directory `n   ", $backupDir)
$stringbudone = [System.String]::Concat("`n   BACKUPS DONE! `n   Savegame: ", $backupsavegameDir, "`n   Config: ", $backupconfigDir)


#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function headlinemuss {
    
    # Darstellung Headline

    Clear-Host
    Write-Host $stringhost -ForegroundColor Magenta
    Write-Host "    _  _  _  _  ____  ____                   " -ForegroundColor White
    Write-Host "   ( \/ )/ )( \/ ___)/ ___)  ___             " -ForegroundColor White
    Write-Host "   / \/ \) \/ (\___ \\___ \ (___)            " -ForegroundColor White
    Write-Host "   \_)(_/\____/(____/(____/                  " -ForegroundColor White
    Write-Host "    _  _   __   __ _   __    ___  ____  ____ " -ForegroundColor White
    Write-Host "   ( \/ ) / _\ (  ( \ / _\  / __)(  __)(  _ \" -ForegroundColor White
    Write-Host "   / \/ \/    \/    //    \( (_ \ ) _)  )   /" -ForegroundColor White
    Write-Host "   \_)(_/\_/\_/\_)__)\_/\_/ \___/(____)(__\_)" -ForegroundColor White
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

If(!(Test-Path $rootgamesrv))
{
    headlinemuss
    Write-Host $stringrdfoundnot
    Start-Sleep -Seconds 2
    
    New-Item -Path $rootgamesrvDIR -Name $rootgamesrvPATH -ItemType "directory"
    
    headlinemuss
    $stringrdcreate
    Start-Sleep -Seconds 2
}
else 
{
    headlinemuss
    Write-Host $stringrdfound
    Start-Sleep -Seconds 2 
}

# Check SteamCMD
headlinemuss
Write-Host "   Check root directory..."
Start-Sleep -Seconds 2

If(!(Test-Path $steamCMDdir))
{
    headlinemuss
    Write-Host $stringsteamcmdfoundnot
    Start-Sleep -Seconds 2
    
    New-Item -Path $rootgamesrv -Name $steamCMDfolder -ItemType "directory"
    
    headlinemuss
    $stringsteamcmdcreate
    Start-Sleep -Seconds 2

    Invoke-WebRequest -Uri $steamdownloadlink -OutFile $steamCMDdir
    $tounzip = Get-ChildItem -Path $steamCMDdir
    Expand-Archive -Path $steamCMDdir\$tounzip -DestinationPath $steamCMDdir
    Remove-Item -Path $steamCMDdir\*.zip

    headlinemuss
    $stringscmddownload
    Start-Sleep -Seconds 2

    Start-Process -FilePath $steamcmd -ArgumentList 'validate +quit' -WindowStyle Hidden
    Wait-Process -Id $steamcmdprocess.Id

    headlinemuss
    $stringscmdbereit
    Start-Sleep -Seconds 2
}
else 
{
    headlinemuss
    Write-Host $stringsteamcmdfound
    Start-Sleep -Seconds 2
   
}

#--- Verarbeitung -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

headlinemuss
Write-Host "   ...preperations completed."
Start-Sleep -Seconds 3

headlinemuss
Write-Host  "   Check for running server..."

If($gameprocess)
{
    headlinemuss
    Write-Host "   Server is currently running.`n   Stopping Server..."
    Start-Sleep -Seconds 2
    
    Stop-Process -Id $gameprocess.Id
    Wait-Process -Id $gameprocess.Id
    
    headlinemuss
    Write-Host "   ...server stopped."
    Start-Sleep -Seconds 2
}
else 
{
    headlinemuss
    Write-Host "   Server is currently not running."
    Start-Sleep -Seconds 2
   
}

headlinemuss
Write-Host "   Backups..."
Start-Sleep -Seconds 2

If(Test-Path $savegameDir)
{
    headlinemuss
    Write-Host $stringbackup
    Start-Sleep -Seconds 4

    If(!(Test-Path $backupDir))
    {
        New-Item -Path $pfadBackup -Name $gameinstancename -ItemType "directory"

        headlinemuss
        Write-Host $stringnewbudir
        Start-Sleep -Seconds 2
    }

    New-Item -Path $backupDir -Name $backuptime -ItemType "directory"
    New-Item -Path $backupDirT -Name $buso -ItemType "directory"
    New-Item -Path $backupDirT -Name $buco -ItemType "directory"

    Copy-Item -Path $savegameDir -Destination $backupsavegameDir -Recurse
    Copy-Item -Path $saveconfig -Destination $backupconfigDir -Recurse

    headlinemuss
    $stringbudone
    Start-Sleep -Seconds 4

}
else 
{
    headlinemuss
    Write-Host "   Nothing to backup..."
    Start-Sleep -Seconds 2
   
}

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

headlinemuss
Write-Host "   Server setup..."
Start-Sleep -Seconds 2

&.\$steamcmd +login $steamlogin +force_install_dir $gameDir +app_update $steamappid +validate +quit
Wait-Process -Id $steamcmdprocess.Id

headlinemuss
Write-Host "   ...server setup done!"
Start-Sleep -Seconds 2

if ($gamemods) 
    {
    
        headlinemuss
        Write-Host "   Mod setup..."
        Start-Sleep -Seconds 2

        foreach ($gamemod in $gamemods)
        {
            &.\$steamcmd +login $steamlogin +workshop_download_item $steamappid $gamemod +validate +quit
            Wait-Process -Id $steamcmdprocess.Id
        }

        headlinemuss
        Write-Host "   ...mod setup done"
        Start-Sleep -Seconds 2
    }
    else 
    {
    headlinemuss
    Write-Host "   ...no mods selected..."
    Start-Sleep -Seconds 2
    }

headlinemuss
Write-Host "   Starting game server..."
&.\$gameEXEfull $gamesrvParameter


#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

stop-process -Id $PID       # Shell schliessen

