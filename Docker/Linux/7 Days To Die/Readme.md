# 7 Days To Die Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/satisfactory.svg)](https://hub.docker.com/r/dockrbyter/satisfactory)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/satisfactory.svg)](https://hub.docker.com/r/dockrbyter/satisfactory)

## How To

##### Open Firewall Ports:
 - 26900/TCP
 - 26900-26903/UDP
 - 8080/TCP 
 
#### Create Data Location
```
mkdir -p $HOME/7daystodie/srv
mkdir -p $HOME/7daystodie/data
mkdir -p $HOME/7daystodie/srvdata
```

#### Config File

[Download config file](https://gist.github.com/thelamescriptkiddiemax/914ba5b4e3a9d085dacb8ff4dbe85e4b)

```
Edit the config file, then copy it on the docker host to:
$HOME/7daystodie/srv
```

###### Run Container
```
docker run 
  --name 7daystodie \
  -it --rm \
  -e PORTTCP=26900 \
  -e PORTUDP=26900-26903 \
  -e PORTALLOCMOD=8080 \
  -v $HOME/7daystodie/srv:/home/steam/server \
  -v $HOME/7daystodie/data:/home/steam/.local/share/7DaysToDie \
  -v $HOME/7daystodie/srvdata:/home/steam/.config/unity3d \
  -p 26900:26900/tcp \
  -p 26900-26903:26900-26903/udp \
  -p 8080:8080/tcp \
7daystodie
```
or
```
docker run --name 7daystodie -it --rm -e PORTTCP=26900 -e PORTUDP=26900-26903 -e PORTALLOCMOD=8080 -v $HOME/7daystodie/srv:/home/steam/server -v HOME/7daystodie/data:/home/steam/.local/share/7DaysToDie -v $HOME/7daystodie/srvdata:/home/steam/.config/unity3d -p 26900:26900/tcp -p 26900-26903:26900-26903/udp -p 8080:8080/tcp 7daystodie
```

###### Docker Compose
##### Download Docker Compose
```
cd $HOME/7daystodie
curl https://raw.githubusercontent.com/dockrbyter/GameServer/master/Docker/Linux/7%20Days%20To%20Die/docker-compose.yml docker-compose.yml
```

##### Run Docker Compose
```
cd $HOME/7daystodie
docker-compose up
```

### Locations
 - Serverfiles: ~/7daystodie/srv
 - Serverfiles: ~/7daystodie/srvdata
 - Save files: ~/7daystodie/data

##### Links
 - https://hub.docker.com/u/dockrbyter
 - https://github.com/dockrbyter/GameServer
 - https://github.com/dockrbyter/GameServer/wiki
 - https://steamcommunity.com/profiles/76561198120366828/myworkshopfiles/?section=guides
 - https://developer.valvesoftware.com/wiki/7_Days_to_Die_Dedicated_Server
 - https://7daystodie.fandom.com/wiki/Server
 - https://community.7daystodie.com/
