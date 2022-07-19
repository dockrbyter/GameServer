<#
cryofallstart.ps1
.DESCRIPTION

    Startet CryoFall Server
    
https://github.com/thelamescriptkiddiemax/GameServer
#>
#--- Variablen ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

$scriptspeed = "2"                                                                  # Darstellungsdauer der Textausgaben in Sekunden                                            EX  2
$fmode = "x"                                                                        # Floating Mode (fuer Debugging)                                                            EX  x

#--- Vorbereitung -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



$scriptname = $MyInvocation.MyCommand.Name

#--- Funktionen ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Scripthead
function scripthead
{

    # create stringhost
    $stringhost = [System.String]::Concat("[ ", $env:UserName, " @ ", $env:computername, " @ ", ((Get-WmiObject Win32_ComputerSystem).Domain), " ", (Get-CimInstance Win32_OperatingSystem | Select-Object Caption), ": ", 
    ((Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\" -Name ReleaseID).ReleaseId), " ]   ", (Get-Date -Format "dd/MM/yyyy HH:mm"), "`n", "[ ", $scriptname, " ]", "`n","`n") 
    $stringhost = $stringhost.replace("{Caption=Microsoft"," ").replace("}", " ")

    # fmode
    if (!$fmode)
    {
        Clear-Host                                                                                                                                  # Clear Screen
    }

    Write-Host $stringhost -ForegroundColor Magenta

    Write-Host "   CryoFall Server-Start" -ForegroundColor Blue

    Write-Host "`n"

}

# Dauer Einblendungen
function scriptspeed ($scriptspeed)
{
    Start-Sleep -Seconds $scriptspeed                                                                                                               # display timeout
}

#--- Verarbeitung -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

scripthead
scriptspeed $scriptspeed

Set-Location -Path $PSScriptRoot\Binaries\Server            # In Binaries-Verzeichnis wechseln

dotnet CryoFall_Server.dll load                             # Server starten

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

