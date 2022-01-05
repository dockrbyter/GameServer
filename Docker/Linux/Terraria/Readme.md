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

#### Run Container
```
docker run --name terraria -it --rm -e PORTGAME=27300 -p 27300:27300/tcp -v $HOME/terraria:/terraria -v $HOME/terraria/world:/.local/share/Terraria/Worlds dockrbyter/terraria
 ```

## Infos

### Environment Variables (and their defaults)
 - PORTGAME=27300

### Locations
 - Server Files: ~/terraria
 - Save Games: ~/terraria/savegames

### Settings
```
Run container, stop container.
Navigate to your data location ($HOME/terraria) and edit "serverconfig.cfg".
Start container.
 ```

##### Links
 - https://terraria.fandom.com/wiki/Guide:Setting_up_a_Terraria_server
 - https://github.com/thelamescriptkiddiemax/GameServer/tree/master/Docker/Linux/Terraria
 - https://hub.docker.com/repository/docker/dockrbyter/terraria
