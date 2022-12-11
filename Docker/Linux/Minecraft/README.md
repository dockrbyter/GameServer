# Minecraft Dedicated Server
### Not my image!
We using here the image from https://github.com/itzg  
GitHub Link:        https://github.com/itzg/docker-minecraft-server  
Docker Hub Link:    https://hub.docker.com/r/itzg/minecraft-server
## How To

##### Open Firewall Ports:
 - 25565/TCP

#### Create Data Location
```
mkdir -p $HOME/minecraft/data
 ```

#### Download Docker-Compose File
```
cd $HOME/minecraft
curl https://raw.githubusercontent.com/dockrbyter/GameServer/master/Docker/Linux/Minecraft/docker-compose.yml docker-compose.yml
```

## Run Container
```
(cd $HOME/minecraft)
docker-compose up
```

##### Links
 - https://hub.docker.com/u/dockrbyter
 - https://github.com/dockrbyter/GameServer
 - https://github.com/dockrbyter/GameServer/wiki
 - https://steamcommunity.com/profiles/76561198120366828/myworkshopfiles/?section=guides
 - https://github.com/itzg/docker-minecraft-server
 - https://hub.docker.com/r/itzg/minecraft-server
 - https://minecraft.fandom.com/
 - https://www.minecraft.net/
