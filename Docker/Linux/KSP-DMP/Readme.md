# Kerbal Space Program DMP Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/kspdmp.svg)](https://hub.docker.com/r/dockrbyter/kspdmp)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/kspdmp.svg)](https://hub.docker.com/r/dockrbyter/kspdmp)
## How To

##### Open Firewall Ports:
 - 6702/TCP

#### Create Data Location
```
mkdir -p $HOME/kspdmp
 ```

#### Run Container
```
docker run --name kspdmp -it --rm -e PORTGAME=6702 -p 6702:6702/tcp -v $HOME/kspdmp:/ksp dockrbyter/kspdmp
 ```

#### Server Update
 - Stop Container
 - Connect from a Windows client like WinSCP or something else to Docker Host
 - Navigate to the KSP-DMP directory
 - Run DMPUpdater.exe
 - Restart Container

## Infos

### Environment Variables (and their defaults)
 - PORTGAME=6702

### Locations
 - Server Files: /ksp
 - Save Game Files: /ksp/Universe
 - Config Files: /ksp/Config

##### Links
 - https://d-mp.org/
 - https://github.com/thelamescriptkiddiemax/GameServer/tree/master/Docker/Linux/KSP-DMP
 - https://hub.docker.com/r/dockrbyter/kspdmp
