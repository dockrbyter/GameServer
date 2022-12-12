# Space Engineers Dedicated Server
### Not my image!
We using here the image from https://github.com/Devidian  
GitHub Link:        https://github.com/Devidian/docker-spaceengineers    
Docker Hub Link:    https://github.com/Devidian/docker-spaceengineers  

## How To ⚙️
Space Engineers is a little more tricky than other Images. So follow these steps and you may get your container running 🫠
##### Open Firewall Ports:
 - 27016/UDP

#### Create Data Location
```bash
mkdir -p $HOME/spaceengineers/data/instances
mkdir -p $HOME/spaceengineers/data/srv
mkdir -p $HOME/spaceengineers/data/steamcmd
```

#### Download Docker-Compose File
```bash
cd $HOME/spaceengineers
curl https://raw.githubusercontent.com/dockrbyter/GameServer/master/Docker/Linux/Space%20Engineers/docker-compose.yml docker-compose.yml
```

### CREATE WORLD AND EDIT FILES
![Space Engineers1](https://raw.githubusercontent.com/dockrbyter/GameServer/master/mediacontent/howto/spaceenginers/se2.png)  
Create a world with the dedicated server tool included on steam.

![Space Engineers2](https://raw.githubusercontent.com/dockrbyter/GameServer/master/mediacontent/howto/spaceenginers/se1.png)  
Name it, set a map, may add mods, ... and save it just as "normal".  

![Space Engineers3](https://raw.githubusercontent.com/dockrbyter/GameServer/master/mediacontent/howto/spaceenginers/se3.png)  
Edit the einvironment variable `INSTANCE_NAME` in `docker-compose.yml` at line 7 and set the name you have choosen in the dedicated server tool. Then edit the einvironment variable `PUBLIC_IP` to the public IP of your Docker host.

![Space Engineers4](https://raw.githubusercontent.com/dockrbyter/GameServer/master/mediacontent/howto/spaceenginers/se4.png)  
Open Windows Explorer and change directory to `%APPDATA%\SpaceEngineersDedicated`. Alongside open something like WinSCP and change direcotry to `$HOME/spaceengineers/data/instances`. Create there a new directory and name it like the world you've created in the dedicated server tool.  

```bash
mkdir -p $HOME/spaceengineers/data/instances/YOURworldNAME
```
![Space Engineers5](https://raw.githubusercontent.com/dockrbyter/GameServer/master/mediacontent/howto/spaceenginers/se9.png)  

Now copy everything from `%APPDATA%\SpaceEngineersDedicated` to your Docker host in `$HOME/spaceengineers/data/instances/YOURworldNAME`. 

![Space Engineers6](https://raw.githubusercontent.com/dockrbyter/GameServer/master/mediacontent/howto/spaceenginers/se6.png)  
Then change directory `$HOME/spaceengineers/data/instances/YOURworldNAME/Saves` and rename the directory there like the world you've created in the dedicated server tool. 🫠🫠🫠🫠🥴  
![Space Engineers7](https://raw.githubusercontent.com/dockrbyter/GameServer/master/mediacontent/howto/spaceenginers/se7.png)  

Now go back to `$HOME/spaceengineers/data/instances/YOURworldNAME` and open `SpaceEngineers-Dedicated.cfg`. Search for `LoadWorld`.   
![Space Engineers8](https://raw.githubusercontent.com/dockrbyter/GameServer/master/mediacontent/howto/spaceenginers/se8.png)  

Edit this section like the world you've created in the dedicated server tool.. 🫠🫠🫠🫠🫠🫠🫠🫠🫠🫠🫠🫠🥴🥴🥴
`<LoadWorld>Z:\appdata\space-engineers\instances\MaximilianNetwork\Saves\Star System</LoadWorld>`  

![Space Engineers9](https://raw.githubusercontent.com/dockrbyter/GameServer/master/mediacontent/howto/spaceenginers/se5.png)  
Since you're right there, prevent the "No IP assigned" - error! 🙃 Edit the IP section to the public IP of your Docker host.  
`<IP>255.255.255.255</IP>`  

### EXAMPLE WORLD
For testing purposes you could use my example instances zip file. Just extract it and override your instances directory.  

```bash
curl https://github.com/dockrbyter/GameServer/raw/master/Docker/Linux/Space%20Engineers/instances.zip instances.zip
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
