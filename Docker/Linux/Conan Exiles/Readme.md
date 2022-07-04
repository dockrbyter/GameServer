# Conan Exilies Dedicated Server
### Not my image!
We using here the image from https://github.com/alinmear  
GitHub Link:        https://github.com/alinmear/docker-conanexiles  
Docker Hub Link:    https://hub.docker.com/r/alinmear/docker-conanexiles/  

## How To

##### Open Firewall Ports:
 - 7777/UDP
 - 7778/UDP
 - 27015/UDP

#### Create Data Location
```
mkdir -p $HOME/conanexiles
 ```

#### Download Docker-Compose File
```
cd $HOME/conanexiles
curl https://raw.githubusercontent.com/dockrbyter/GameServer/master/Docker/Linux/Valheim/docker-compose.yml docker-compose.yml
 ```

#### Download .env File
Download and edit the .env file. Theres a section, called "THINGS YOU SHOULDN'T TOUCH" - You'd better don't touch these settings... :D
```
cd $HOME/conanexiles
curl https://raw.githubusercontent.com/dockrbyter/GameServer/master/Docker/Linux/Valheim/docker-compose.yml .env
 ```

## Run Container
```
(cd $HOME/conanexiles)
docker-compose up
```

#### Locations
 - ~/conanexiles        Binaries

##### Links
 - https://hub.docker.com/u/dockrbyter
 - https://github.com/dockrbyter/GameServer
 - https://github.com/dockrbyter/GameServer/wiki
 - https://steamcommunity.com/profiles/76561198120366828/myworkshopfiles/?section=guides
 - https://github.com/alinmear/docker-conanexiles
 - https://hub.docker.com/r/alinmear/docker-conanexiles/
 - https://www.conanexiles.com/dedicated-servers/
 - https://forums.funcom.com/c/conan-exiles/exiles-pc/pc-servers/128
 - https://conanexiles.fandom.com/wiki/Server_Configuration
