# Kerbal Space Program LMP Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/ksplmp.svg)](https://hub.docker.com/r/dockrbyter/ksplmp)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/ksplmp.svg)](https://hub.docker.com/r/dockrbyter/ksplmp)
## How To

##### Open Firewall Ports:
 - 8800/UDP

#### Create Data Location
```
mkdir -p $HOME/ksplmp/universe
 ```

#### Mod Config File

[Download config file](https://gist.github.com/thelamescriptkiddiemax/cb350ba360308b7488f3521fe18ca339) or create your own.

```
Edit the mod config file, then copy it on the docker host to:
$HOME/ksplmp
 ```

#### Run Container
```
docker run --name ksplmp -it --rm -e PORTGAME=8800 -p 8800:8800/udp -v $HOME/ksplmp:/ksp/Config -v $HOME/ksplmp/universe:/ksp/Universe -v $HOME/ksplmp/LMPModControl.xml:/ksplmp/LMPModControl.xml dockrbyter/ksplmp
 ```

## Infos

### Environment Variables (and their defaults)
 - PORTGAME=8800

### Locations
 - Mod Config File: /ksplmp
 - Save Game Files: /ksp/Universe
 - Config Files: /ksp/Config

##### Links
 - https://github.com/LunaMultiplayer/LunaMultiplayer/wiki/Create-a-server
 - https://github.com/LunaMultiplayer/LunaMultiplayer/wiki/Mod-file
 - https://github.com/thelamescriptkiddiemax/GameServer/tree/master/Docker/Linux/KSP-DMP
 - https://gist.github.com/thelamescriptkiddiemax/cb350ba360308b7488f3521fe18ca339
 - https://hub.docker.com/r/dockrbyter/ksplmp
