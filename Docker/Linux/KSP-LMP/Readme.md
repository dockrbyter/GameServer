# Kerbal Space Program LMP Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/kspdmp.svg)](https://hub.docker.com/r/dockrbyter/kspdmp)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/kspdmp.svg)](https://hub.docker.com/r/dockrbyter/kspdmp)
## How To

##### Open Firewall Ports:
 - 8800/UDP

#### Create Data Location
```
mkdir -p $HOME/ksplmp
 ```

#### Run Container
```
docker run --name ksplmp -it --rm -e PORTGAME=6702 -p 6702:6702/tcp -v $HOME/ksplmp:/ksp dockrbyter/ksplmp
 ```

#### Server Update
 - Stop Container
 - Connect from a Windows client like WinSCP or something else to Docker Host
 - Navigate to the KSP-DMP directory
 - Run DMPUpdater.exe
 - Restart Container

## Infos

### Environment Variables (and their defaults)
 - PORTGAME=8800

### Locations
 - Server Files: /ksplmp
 - Save Game Files: /ksp/Universe
 - Config Files: /ksp/Config

##### Links
 - https://github.com/LunaMultiplayer/LunaMultiplayer/wiki/Create-a-server
 - https://github.com/thelamescriptkiddiemax/GameServer/tree/master/Docker/Linux/KSP-DMP
 - https://hub.docker.com/r/dockrbyter/kspdmp
