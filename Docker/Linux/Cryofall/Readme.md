# Cryofall Dedicated Server
### Not my image!
We using here the image from https://hub.docker.com/r/atomictorch/cryofall-server

## How To

##### Open Firewall Ports:
 - 6000/UDP

#### Create Data Location
```
mkdir -p $HOME/cryofall
 ```

#### Download Docker-Compose File
```
cd $HOME/cryofall
curl https://raw.githubusercontent.com/dockrbyter/GameServer/master/Docker/Linux/Cryofall/docker-compose.yml docker-compose.yml
 ```

## Run Container
```
(cd $HOME/cryofall)
docker-compose up
 ```

## Stop Container
Shure, you could use `docker stop <CONTAINERNAME>`,  `docker stop <CONTAINERID>` or `docker-compose down` to stop your Cryofall container, but if you do so, you may loose some save data. To avoid that, theres a more convinent way to stop the container without loosing data. Attach to the running container - `docker attach  <CONTAINERNAME>`, or `docker attach  <CONTAINERID>`. Attached to the container, you could send a *stop* command like that: `stop TIMEinSECONDS STOPPmessage`  
So the comannd `stop 30 Server shutdown in 30 Seconds!` will stopp the server in 30 Seconds and send the ingame message "Server shutdown in 30 Seconds!" to the players on the server. The command `stop 0` will stop the server immediately without warning. If you don't know the container name or ID, type `docker ps` on your Docker host and you will get some information about all running containers.

#### Updates
I don't why, but Atomictorch don't uses the tag "latest". So you have to handle server updates on you own. Check their current tags at: https://hub.docker.com/r/atomictorch/cryofall-server/tags
There's also an update guide at: https://wiki.atomictorch.com/CryoFall/Server/Setup

#### Locations
 - Server Files: ~/cryofall
 - Settings:  ~/cryofall/SettingsServer.xml
 - Settings:  ~/cryofall/ServerRates.config

##### Links
 - https://hub.docker.com/u/dockrbyter
 - https://github.com/dockrbyter/GameServer
 - https://github.com/dockrbyter/GameServer/wiki
 - https://steamcommunity.com/profiles/76561198120366828/myworkshopfiles/?section=guides
 - https://hub.docker.com/r/atomictorch/cryofall-server
 - https://hub.docker.com/r/atomictorch/cryofall-server/tags
 - https://wiki.atomictorch.com/CryoFall/Server/Setup
