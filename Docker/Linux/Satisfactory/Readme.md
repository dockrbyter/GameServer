# Satisfactory Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/satisfactory.svg)](https://hub.docker.com/r/dockrbyter/satisfactory)

## How To
### Firewall Ports
 - 15777/UDP
 - 7777/UDP
 - 15000/UDP
 
### Create Date Location
 - mkdir mkdir -p $HOME/satisfactory/conf
 
 ### Run Container
  - docker run --name satisfactory -it --rm -p 15777:15777/udp -p 15000:15000/udp -p 7777:7777/udp -v $HOME/satisfactory:/home/steam/server -v $HOME/satisfactory/conf:/home/steam/.config dockrbyter/satisfactory![image](https://user-images.githubusercontent.com/60104113/139556779-59817ee6-d2a5-4410-8d07-ed6a61ffd15e.png)
