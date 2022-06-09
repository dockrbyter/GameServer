# SteamCMD - Windows Core Server
#
# https://raw.githubusercontent.com/thelamescriptkiddiemax/GameServer/master/Docker/Windows/SteamCMD/dockerfile
# https://hub.docker.com/r/dockrbyter/steamcmd
#
#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Core Server ltsc2019 / Powershell
FROM mcr.microsoft.com/windows/servercore:ltsc2019
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

USER ContainerAdministrator

RUN Set-ExecutionPolicy Unrestricted; \
    Install-PackageProvider -Name NuGet -Confirm:$False -Force; \
    Install-Module -Name SteamPS -Scope AllUsers -Confirm:$False -Force; \
    Install-SteamCMD -Confirm:$False -Force

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Start Server
CMD  [ "powershell", "-NoExit" ]
