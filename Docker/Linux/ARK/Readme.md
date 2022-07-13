# ARK: Survival Evolved Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/arksurvivalevolved.svg)](https://hub.docker.com/r/dockrbyter/arksurvivalevolved)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/arksurvivalevolved.svg)](https://hub.docker.com/r/dockrbyter/arksurvivalevolved)

## How To

##### Open Firewall Ports:
 - 27020/TCP
 - 27015/UDP
 - 7778/UDP
 - 7777/UDP

#### Create Data Location
```
mkdir -p $HOME/ark/arkdata
mkdir -p $HOME/ark/srv1
mkdir -p $HOME/ark/srv2
mkdir -p $HOME/ark/srv3

... (as many as you want)
 ```

#### Run Container ark1
```
docker run --name ark1 -it --rm -p 27020:27020/tcp -p 27015:27015/udp -p 7778:7778/udp -p 7777:7777/udp -v $HOME/steam:/home/steam/.steam -v $HOME/ark/srv1:/home/steam/server -v $HOME/ark/arkdata:/home/steam/arkdata -e PORTGAME=7777 -e PORTRAW=7778 -e PORTQUERY=27015 -e PORTRCON=27020 -e SERVERNAME=<SUPERCOOLSRVNAME> -e MAP=<MAPNAME> -e ADMINPW=<SUPERSTRONADMINGPW> -e CLUSTERID=<UNIQUECLUSTERID> dockrbyter/arksurvivalevolved

(Edit everything in <> (and remove <>))
 ```

#### Run Container ark2
```
docker run --name ark2 -it --rm -p 27021:27021/tcp -p 27017:27017/udp -p 7782:7782/udp -p 7781:7781/udp -v $HOME/steam:/home/steam/.steam -v $HOME/ark/srv2:/home/steam/server -v $HOME/ark/arkdata:/home/steam/arkdata -e PORTGAME=7781 -e PORTRAW=7782 -e PORTQUERY=27017 -e PORTRCON=27021 -e SERVERNAME=<SUPERCOOLSRVNAME> -e MAP=<MAPNAME> -e ADMINPW=<SUPERSTRONADMINGPW> -e CLUSTERID=<UNIQUECLUSTERID> dockrbyter/arksurvivalevolved

(Edit everything in <> (and remove <>), don't forget to create another save game location (mkdir -p $HOME/ark/srv2) and add the port forwardings to your firewall)
 ```

### Environment Variables (and their defaults)
 - GAMEID=376030
 - SERVERNAME=dockrbyter
 - MAP=TheIsland
 - MAXPLAYERS=16
 - ADMINPW=welovemax
 - MULTIHOMEIP=0.0.0.0
 - CLUSTERDIR=/home/steam/arkcluster
 - CLUSTERID=dockrbyter
 - USER=steam

### Locations
 - Server Files: ~/ark/srv1
 - Settings: ~ark/srv1/ShooterGame/Saved/Config/LinuxServer
 - Save Games: ~ark/srv1/ShooterGame/Saved/SavedArks
 - Cluster Files: ~/ark/arkdata/clusters/CLUSTERID


##### Links
 - https://ark.fandom.com/wiki/Dedicated_server_setup
 - https://hub.docker.com/r/dockrbyter/arksurvivalevolved
 - https://github.com/thelamescriptkiddiemax/GameServer/tree/master/Docker/Linux/ARK
