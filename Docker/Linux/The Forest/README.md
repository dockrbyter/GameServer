# The Forest Dedicated Server
### Not my image!
We using here the image from https://github.com/jammsen  
GitHub Link:        https://github.com/jammsen/docker-the-forest-dedicated-server  
Docker Hub Link:    https://hub.docker.com/r/jammsen/the-forest-dedicated-server  

## HOW TO ⚙️

#### OPEN FIREWALLPORTS
 - 8766/tcp
 - 8766/udp
 - 27015/tcp
 - 27015/udp
 - 27016/tcp
 - 27016/udp

#### CREATE DATA LOCATION
```bash
mkdir -p $HOME/theforest/data/srv
mkdir -p $HOME/theforest/data/winedata
mkdir -p $HOMEs/theforest/data/steamcmd
 ```

#### DOWNLOAD DOCKER COMPOSE FILE
```bash
cd $HOME/theforest
curl https://raw.githubusercontent.com/dockrbyter/GameServer/master/Docker/Linux/The%20Forest/docker-compose.yml docker-compose.yml
 ```

#### CREATE STEAM TOKEN
1. Create a new game server account over at https://steamcommunity.com/dev/managegameservers (Use AppID: `242760`)
2. Insert the Login Token into the environment variable via docker-run or docker-compose (at `SERVER_STEAM_ACCOUNT_TOKEN`)

## RUN CONTAINER
```bash
(cd $HOME/theforest)
docker-compose up
```

### LINKS
 - https://hub.docker.com/u/dockrbyter
 - https://github.com/dockrbyter/GameServer
 - https://github.com/dockrbyter/GameServer/wiki
 - https://github.com/jammsen/docker-the-forest-dedicated-server 
 - https://hub.docker.com/r/jammsen/the-forest-dedicated-server
 - https://theforest.fandom.com/wiki/The_Forest_Wiki
