# Satisfactory Dedicated Server
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/satisfactory.svg)](https://hub.docker.com/r/dockrbyter/satisfactory)

![alt text](https://img2.storyblok.com/fit-in/0x300/filters:format(png)/f/110098/5405x1416/10decfbcac/hero-logo.png)

## How To
### Firewall Ports
 - 15777/UDP
 - 7777/UDP
 - 15000/UDP
 
### Create Data Location
 - mkdir mkdir -p $HOME/satisfactory/conf
 
 ### Run Container
  - docker run --name satisfactory -it --rm -p 15777:15777/udp -p 15000:15000/udp -p 7777:7777/udp -v $HOME/satisfactory:/home/steam/server -v $HOME/satisfactory/conf:/home/steam/.config dockrbyter/satisfactory
