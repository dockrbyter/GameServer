# MINDUSTRY DEDICATED SERVER
### Not my image!
We using here the image from https://github.com/oldshensheep  
GitHub Link:        https://github.com/oldshensheep/Mindustry    
Docker Hub Link:    https://hub.docker.com/r/oldshensheep/mindustry-server  

## HOW TO ⚙️
### FIREWALL
Open Ports:
 - 6567/UDP
 - 6567/TCP

### DOCKER COMPOSE
#### DOWNLOAD DOCKER COMPOSE FILE
```bash
mkdir -p $HOME/mindustry/data
cd $HOME/mindustry
curl https://raw.githubusercontent.com/dockrbyter/retroarch-web/master/docker-compose.yml docker-compose.yml
```

#### RUN DOCKER COMPOSE FILE
```bash
docker-compose up -d
```

#### FIRST RUN
After server startup type `maps all` to view all inbuild maps. Or add some to `$HOME/mindustry/maps`. Load your map with `host <mapname> [gamemode]`. Example: `host Maze survival`  

#### SAVE GAME
Type `save 1` (or save *wathever*) to save your game.

### LINKS
https://hub.docker.com/r/oldshensheep/mindustry-server 
https://github.com/oldshensheep/Mindustry   
https://mindustrygame.github.io/wiki/servers/  
https://mindustrygame.github.io/wiki/servers/#dedicated-server-commands  
https://mindustrygame.github.io/  
https://github.com/dockrbyter/GameServer  
https://willo.is-a.dev/imgToMsav/  
https://github.com/Quezler/mindustry__nydus--map-pool  
