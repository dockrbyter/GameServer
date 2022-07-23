# Space Engineers Dedicated Server
![Help Wanted](https://img.shields.io/badge/code-Help%20Wanted-red?logo=github)
# UNFINISHED! Not pushed to Docker Hub!
Contributers welcome! I don't get it to start.  
Here's my work so far...  

The container starts up and after two or three minutes the servcies fails and the container keeps running. The srv directory will be written with data, but the container do not write in the world directory. I can't find any logs.

## Testing Only
## How To
##### Open Firewall Ports:
 - 27016/UDP
 - 8080/TCP
 
#### Create Data Location
```
New-Item -Type Directory C:\docker\spaceengineers\srv
New-Item -Type Directory C:\docker\spaceengineers\world
 ```
#### Run Container
```
docker run --name spaceengineers -it --rm -e PORTGAME='27016' -e PORTWEB='8080' -p 27016:27016 -p 8080:8080 -v C:\docker\spaceengineers\srv:C:\spaceengineers -v C:\docker\spaceengineers\world:C:\world spaceengineers
 ```

### Environment Variables (and their defaults)
PORTGAME="27016"
PORTWEB="8080"
 
### Locations
 - Server Files: C:\spaceengineers\srv
 - Save Game: C:\spaceengineers\world

##### Links
 - https://github.com/dockrbyter/GameServer/tree/master/Docker/Windows/Space%20Engineers
 - https://github.com/dockrbyter/GameServer
 - https://steamcommunity.com/profiles/76561198120366828/myworkshopfiles/?section=guides
 - https://www.spaceengineersgame.com/dedicated-servers
