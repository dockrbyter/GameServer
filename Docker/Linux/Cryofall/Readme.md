# Cryofall Dedicated Server
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

#### Run Container
```
(cd $HOME/cryofall)
docker-compose up
 ```

### Locations
 - Server Files: ~/cryofall
 - Settings:  ~/cryofall/SettingsServer.xml
 - Settings:  ~/cryofall/ServerRates.config

##### Links
 - https://hub.docker.com/u/dockrbyter
 - https://github.com/dockrbyter/GameServer
 - https://github.com/dockrbyter/GameServer/wiki
 - https://steamcommunity.com/profiles/76561198120366828/myworkshopfiles/?section=guides
 - https://hub.docker.com/r/atomictorch/cryofall-server
