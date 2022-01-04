# Kerbal Space Program DMP Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/kspdmp.svg)](https://hub.docker.com/r/dockrbyter/kspdmp)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/kspdmp.svg)](https://hub.docker.com/r/dockrbyter/kspdmp)
## How To

##### Open Firewall Ports:
 - 6702/TCP

#### Create Data Location
```
mkdir -p $HOME/kspdmp/config
mkdir -p $HOME/kspdmp/universe
 ```

#### Run Container
```
docker run --name kspdmp -it --rm -e PORTGAME=6702 -p 6702:6702/tcp -v $HOME/kspdmp/config:/ksp/Config -v $HOME/kspdmp/universe:/ksp/Universe dockrbyter/kspdmp
 ```

## Infos

### Environment Variables (and their defaults)
 - PORTGAME=6702

### Locations
 - Save Game Files: /ksp/universe
 - Config Files: /ksp/config

##### Links
 - https://d-mp.org/
 - https://github.com/thelamescriptkiddiemax/GameServer/tree/master/Docker/Linux/KSP-DMP
 - https://hub.docker.com/r/dockrbyter/kspdmp
