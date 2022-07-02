# V Rising Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/vrising.svg)](https://hub.docker.com/r/dockrbyter/vrising)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/vrising.svg)](https://hub.docker.com/r/dockrbyter/vrising)

## How To
##### Open Firewall Ports:
 - 9876/UDP
 - 9877/UDP

 
#### Create Data Location
```
New-Item -Type Directory C:\docker\vrising\srv
New-Item -Type Directory C:\docker\vrising\data
 ```
 
#### Run Container
```
docker run --name vrising --rm -p 9876:9876 -p 9877:9877 -v c:\docker\vrising\srv:'c:/vrsing' -v c:\docker\vrising\data:'c:/users/containeradministrator/appdata/locallow/stunlock studios/vrisingserver/Saves' -e SERVERNAME="dockrbyter" -e MAXADMINS='1' -e MAXPLAYERS='10' -e PORTGAME='9876' -e PORTQUERY='9877' dockrbyter/vrising
 ```

### Environment Variables (and their defaults)
SERVERNAME="dockrbyter"
MAXPLAYERS="13"
MAXADMINS="3"
PORTGAME="9876"
PORTQUERY="9877"
 
### Locations
 - Serverfiles: C:\vrising\srv
 - Settings/SaveGames: C:\vrising\data

##### Links
 - https://hub.docker.com/r/dockrbyter/vrising
 - https://github.com/dockrbyter/GameServer/tree/master/Docker/Windows/V%20Rising
 - https://vrising.fandom.com/wiki/V_Rising_Dedicated_Server
