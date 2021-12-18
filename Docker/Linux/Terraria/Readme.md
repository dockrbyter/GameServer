# Terraria Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/arksurvivalevolved.svg)](https://hub.docker.com/r/dockrbyter/arksurvivalevolved)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/arksurvivalevolved.svg)](https://hub.docker.com/r/dockrbyter/arksurvivalevolved)

## How To

##### Open Firewall Ports:
 - 7777/TCP

#### Create Data Location
```
mkdir -p $HOME/terraria/savegames
mkdir -p $HOME/terraria/data
 ```

#### Run Container
```
docker run --name terraria -it --rm -e PORTGAME=7777 -p 7777:7777/tcp -v $HOME/terraria:/terraria -v $HOME/terraria/savegames:/.local/share/Terraria/Worlds -v $HOME/terraria/data:/terraria/data dockrbyter/terraria

(Edit everything in <> (and remove <>))
 ```

### Environment Variables (and their defaults)
 - PORTGAME=7777


### Locations
 - Server Files: ~/terraria
 - Save Games: ~/terraria/savegames
 - Script Files: ~/terraria/data


##### Links
 - https://terraria.fandom.com/wiki/Guide:Setting_up_a_Terraria_server
