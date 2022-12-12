# Space Engineers Dedicated Server
### Not my image!
We using here the image from https://github.com/mmmaxwwwell  
GitHub Link:        https://github.com/mmmaxwwwell/space-engineers-dedicated-docker-linux  
Docker Hub Link:    https://hub.docker.com/r/mmmaxwwwell/space-engineers-dedicated-docker-linux
## How To ⚙️
##### Open Firewall Ports:
 - 27016/UDP

#### Create Data Location
Space Engineers is a little more tricky than other Images. So follow these steps and you may get cour container running 🫠
```bash
mkdir -p $HOME/spaceengineers/data
```

#### Download Docker-Compose File
```bash
cd $HOME/spaceengineers
curl https://raw.githubusercontent.com/dockrbyter/GameServer/master/Docker/Linux/Minecraft/docker-compose.yml docker-compose.yml
```

## Run Container
```bash
(cd $HOME/spaceengineers)
docker-compose up
```

##### Links
 - https://hub.docker.com/u/dockrbyter
 - https://github.com/dockrbyter/GameServer
 - https://github.com/dockrbyter/GameServer/wiki
 - https://steamcommunity.com/profiles/76561198120366828/myworkshopfiles/?section=guides
 - https://github.com/Devidian/docker-spaceengineers
 - https://hub.docker.com/r/devidian/spaceengineers/
 - https://www.spaceengineersgame.com/dedicated-servers
