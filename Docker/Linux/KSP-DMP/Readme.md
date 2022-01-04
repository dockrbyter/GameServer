# Kerbal Space Program DMP Dedicated Server
## How To

##### Open Firewall Ports:
 - 6702/TCP

#### Create Data Location
```
mkdir -p $HOME/ksp
 ```

#### Run Container
```
docker run --name kspdmp -it --rm -e PORTGAME=6702 -p 6702:6702/tcp -v $HOME/ksp:/ksp dockrbyter/kspdmp

 ```

### Environment Variables (and their defaults)
 - PORTGAME=6702


### Locations
 - Server Files: /ksp
 - Save Game Files: /ksp/Universe
 - Config Files: /ksp/Config


##### Links
 - https://d-mp.org/
