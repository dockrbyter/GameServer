# Terraria Dedicated Server

## How To

##### Open Firewall Ports:
 - 7777/TCP

#### Create Data Location
```
mkdir -p $HOME/terraria/savegames
 ```

#### Run Container
```
docker run --name terraria -it --rm -e PORTGAME=7777 -p 7777:7777/tcp -v $HOME/terraria:/terraria -v $HOME/terraria/savegames:/.local/share/Terraria/Worlds -v $HOME/terraria/data:/terraria/data dockrbyter/terraria
 ```

## Infos

### Environment Variables (and their defaults)
 - PORTGAME=7777

### Locations
 - Server Files: ~/terraria
 - Save Games: ~/terraria/savegames
 - Script Files: ~/terraria/data

### Settings
```
Run container, stop container.
Navigate to your data location ($HOME/terraria) and edit "serverconfig.cfg".
Start container.
 ```

##### Links
 - https://terraria.fandom.com/wiki/Guide:Setting_up_a_Terraria_server
