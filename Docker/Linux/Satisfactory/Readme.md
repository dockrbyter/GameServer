# Satisfactory Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/satisfactory.svg)](https://hub.docker.com/r/dockrbyter/satisfactory)

![alt text](https://www.google.com/url?sa=i&url=https%3A%2F%2Fsatisfactory.fandom.com%2Fwiki%2FSatisfactory&psig=AOvVaw22Aswbl-QG1QbrsHLDEFTg&ust=1635710436944000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJDLjJD28vMCFQAAAAAdAAAAABAD)

## How To
### Firewall Ports
 - 15777/UDP
 - 7777/UDP
 - 15000/UDP
 
### Create Data Location
 - mkdir mkdir -p $HOME/satisfactory/conf
 
 ### Run Container
  - docker run --name satisfactory -it --rm -p 15777:15777/udp -p 15000:15000/udp -p 7777:7777/udp -v $HOME/satisfactory:/home/steam/server -v $HOME/satisfactory/conf:/home/steam/.config dockrbyter/satisfactory
