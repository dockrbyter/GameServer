# Satisfactory Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/satisfactory.svg)](https://hub.docker.com/r/dockrbyter/satisfactory)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/satisfactory.svg)](https://hub.docker.com/r/dockrbyter/satisfactory)

## How To

##### Open Firewall Ports:
 - 15777/UDP
 - 7777/UDP
 - 15000/UDP

 
#### Create Data Location
```
mkdir -p $HOME/satisfactory/conf
 ```
 
#### Run Container
```
docker run --name satisfactory -it --rm -p 15777:15777/udp -p 15000:15000/udp -p 7777:7777/udp -v $HOME/satisfactory:/home/steam/server -v $HOME/satisfactory/conf:/home/steam/.config dockrbyter/satisfactory:1.1
 ```
 
### Locations
 - Serverfiles: ~/satisfactory
 - Settings: ~/satisfactory/FactoryGame/Saved/Config/LinuxServer
 - SaveGames: ~/satisfactory/conf/Epic/FactoryGame/Saved/SaveGames/server


##### Links
 - https://satisfactory.fandom.com/wiki/Dedicated_servers
 - https://hub.docker.com/r/dockrbyter/satisfactory
 - https://github.com/thelamescriptkiddiemax/GameServer/tree/master/Docker/Linux/Satisfactory
