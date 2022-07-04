# V Rising Dedicated Server
### Not my image!
We using here the image from https://github.com/TrueOsiris
GitHub Link:        https://github.com/TrueOsiris/docker-vrising  
Docker Hub Link:    https://hub.docker.com/r/trueosiris/vrising  

This is a Linux image. I've written a Windows image which can be found at:  
https://github.com/dockrbyter/GameServer/tree/master/Docker/Windows/V%20Rising

## How To

##### Open Firewall Ports:
 - 9876/UDP
 - 9877/UDP

#### Create Data Location
```
mkdir -p $HOME/vrising
 ```

#### Download Docker-Compose File
```
cd $HOME/vrising
curl https://raw.githubusercontent.com/dockrbyter/GameServer/master/Docker/Linux/Valheim/docker-compose.yml docker-compose.yml
 ```

## Run Container
```
(cd $HOME/vrising)
docker-compose up
```

#### Locations
 - ~/vrising/srv    Binaries
 - ~/vrising/data   Data

##### Links
 - https://hub.docker.com/u/dockrbyter
 - https://github.com/dockrbyter/GameServer
 - https://github.com/dockrbyter/GameServer/wiki
 - https://steamcommunity.com/profiles/76561198120366828/myworkshopfiles/?section=guides
 - https://github.com/TrueOsiris/docker-vrising
 - https://hub.docker.com/r/trueosiris/vrising
 - https://vrising.fandom.com/wiki/V_Rising_Dedicated_Server
 - https://github.com/dockrbyter/GameServer/tree/master/Docker/Windows/V%20Rising
