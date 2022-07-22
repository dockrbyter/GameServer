# Terraria Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/terraria.svg)](https://hub.docker.com/r/dockrbyter/terraria)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/terraria.svg)](https://hub.docker.com/r/dockrbyter/terraria)
## How To

##### Open Firewall Ports:
 - 27300/TCP

#### Create Data Location
```
mkdir -p $HOME/terraria/world
 ```

#### Config File

[Download config file](https://gist.github.com/dockrbyter/914ba5b4e3a9d085dacb8ff4dbe85e4b)

```
Edit the config file, then copy it on the docker host to:
$HOME/terraria
 ```

#### Run Container
```
docker run --name terraria -it --rm -e PORTGAME=27300 -p 27300:27300/tcp -v $HOME/terraria/terrariaserverconfig.txt:/terraria/terrariaserverconfig.txt -v $HOME/terraria/world:/.local/share/Terraria/Worlds dockrbyter/terraria
 ```

## Infos

### Environment Variables (and their defaults)
 - PORTGAME=27300

### Locations
 - Config File: ~/terraria
 - Save Games: ~/terraria/world

##### Links
 - https://terraria.fandom.com/wiki/Guide:Setting_up_a_Terraria_server
 - https://github.com/thelamescriptkiddiemax/GameServer/tree/master/Docker/Linux/Terraria
 - https://hub.docker.com/repository/docker/dockrbyter/terraria
 - https://gist.github.com/thelamescriptkiddiemax/914ba5b4e3a9d085dacb8ff4dbe85e4b
