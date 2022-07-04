# Valheim Dedicated Server
### Not my image!
We using here the image from https://github.com/lloesche
That's great work and theres no need to write our own image! :D
(There is already a really good guide, check out his Docker Hub page ;)

GitHub Link:        https://github.com/lloesche/valheim-server-docker
Docker Hub Link:    https://hub.docker.com/r/lloesche/valheim-server

## How To

##### Open Firewall Ports:
 - 2456/UDP
 - 2457/UDP
 - 9001/TCP

#### Create Data Location
```
mkdir -p $HOME/valheim
 ```

#### Download Docker-Compose File
```
cd $HOME/valheim
curl https://raw.githubusercontent.com/dockrbyter/GameServer/master/Docker/Linux/Valheim/docker-compose.yml docker-compose.yml
 ```

## Run Container
```
(cd $HOME/valheim)
docker-compose up
```

#### .env File
Download and edit the .env file to make your server unique and discoverable by your friends and players. Delete every setting you don't need.
A basic .env file could look like that:
```
SERVER_NAME="My Docker powered Valheim Server"
WORLD_NAME="UltraCoolVikingWorld"
SERVER_PASS="superSecur3PW2"
TZ="CEST"
UPDATE_IF_IDLE=true
```

#### Locations
 - Settings:    $HOME/valheim/config
 - Data:        $HOME/valheim/data

##### Links
 - https://hub.docker.com/u/dockrbyter
 - https://github.com/dockrbyter/GameServer
 - https://github.com/dockrbyter/GameServer/wiki
 - https://steamcommunity.com/profiles/76561198120366828/myworkshopfiles/?section=guides
 - https://hub.docker.com/r/lloesche/valheim-server
 - https://valheim.fandom.com/wiki/Valheim_Dedicated_Server
 - https://github.com/lloesche/valheim-server-docker
