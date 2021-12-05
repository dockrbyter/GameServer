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
mkdir -p $HOME/ark/cluster
mkdir -p $HOME/ark/srv1
 ```

#### Run Container (The Island with default settings)
```
docker run --name ark1 -it --rm -p 27020:27020/tcp -p 27015:27015/udp -p 7778:7778/udp -p 7777:7777/udp -v $HOME/ark/srv1:/home/steam/server -v $HOME/ark/cluster:/home/steam/arkcluster -e SERVERNAME=<SUPERCOOLSRVNAME> -e SERVERPW=<SUPERSTRONGPW> -e ADMINPW=<SUPERSTRONADMINGPW> -e CLUSTERID=<UNIQUECLUSTERID> dockrbyter/arksurvivalevolved

(Edit everything in <> (and remove <>))
 ```

#### Run Container (Valguero as second instance)
```
docker run --name ark2 -it --rm -p 27021:27020/tcp -p 27016:27015/udp -p 7780:7778/udp -p 7779:7777/udp -v $HOME/ark/srv2:/home/steam/server -v $HOME/ark/cluster:/home/steam/arkcluster -e SERVERNAME=<SUPERCOOLSRVNAME> -e SERVERPW=<SUPERSTRONGPW> -e ADMINPW=<SUPERSTRONADMINGPW> -e CLUSTERID=<UNIQUECLUSTERID> -e MAP=Valguero_P dockrbyter/arksurvivalevolved

(Edit everything in <> (and remove <>), don't forget to create another save game location (mkdir -p $HOME/ark/srv2) and add the port forwardings to your firewall)
 ```

### Environment Variables (and their defaults)
 - GAMEID=376030
 - SERVERNAME=maximiliannetwork
 - MAP=TheIsland
 - MAXPLAYERS=16
 - SERVERPW=welovemax
 - ADMINPW=welovemax
 - MULTIHOMEIP=0.0.0.0
 - CLUSTERDIR=/home/steam/arkcluster
 - CLUSTERID=maximiliannetwork

### Locations
 - Server Files: ~/ark/srv1
 - Settings: ~/ark/srv1/ShooterGame/Saved/Config/LinuxServer
 - Save Games: ~/ark/srv1/ShooterGame/Saved/SavedArks
 - Cluster Files: ~/ark/cluster


##### Links
 - https://ark.fandom.com/wiki/Dedicated_server_setup
 - https://hub.docker.com/r/dockrbyter/arksurvivalevolved
 - https://github.com/thelamescriptkiddiemax/GameServer/tree/master/Docker/Linux/ARK
