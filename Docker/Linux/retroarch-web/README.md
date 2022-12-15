# Retroarch-Web
[![Docker Pulls](https://img.shields.io/docker/pulls/dockrbyter/retroarch-web.svg)](https://hub.docker.com/r/dockrbyter/retroarch-web)
[![Image Size](https://img.shields.io/docker/image-size/dockrbyter/retroarch-web.svg)](https://hub.docker.com/r/dockrbyter/retroarch-web)

## HOW TO ⚙️
### FIREWALL
Open Ports:
 - 80/TCP

### DOCKER RUN
```bash
docker run -d --rm --name retroarch-web -p 80:80 dockrbyter/retroarch-web:latest
```

### DOCKER COMPOSE
#### DOWNLOAD DOCKER COMPOSE FILE
```bash
mkdir -p $HOME/retroarch-web
cd $HOME/retroarch-web
curl https://raw.githubusercontent.com/dockrbyter/retroarch-web/master/docker-compose.yml docker-compose.yml
```

#### RUN DOCKER COMPOSE FILE
```bash
docker-compose up -d
```

### LOAD ROMS
After selecting Core, click Run. After RetroArch opens, click 'Add Content' and select your compatible ROM. Now click on 'Load Content', then 'Start Directory'. Here's your ROM, click on it, play it.

##### REPO
Github: https://github.com/dockrbyter/retroarch-web  
DockerHub: https://hub.docker.com/r/dockrbyter/retroarch-web
##### ORIGIN
Based on https://github.com/libretro/RetroArch/tree/master/pkg/emscripten,  
forked from https://github.com/Inglebard/dockerfiles  
