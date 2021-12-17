# Terraria 
#
# https://github.com/thelamescriptkiddiemax/
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Base Image 
FROM alpine
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Label
LABEL image.authors="Max"
LABEL description="Terraria Dedicated Server"
LABEL "other"="https://github.com/thelamescriptkiddiemax"
#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Environment Variables
ENV PORTGAME=7777

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Download Server Files
RUN mkdir -p /terraria/setup \
    mkdir -p /terraria/

ADD https://www.terraria.org/api/download/pc-dedicated-server/terraria-server-1432.zip /terraria/setup/
ADD . /terraria/

RUN apk update \
    apk upgrade \
    apk search zip \
    apk add zip

WORKDIR /terraria/setup

RUN unzip *.zip -d /terraria/setup \
    mv -v /terraria/setup/1432/Linux/* /terraria

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Persistent Data
VOLUME /terraria
VOLUME ~/.local/share/Terraria/Worlds

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Expose Ports
EXPOSE $PORTGAME/tcp

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Start Terraria Server
#CMD [ "terraria/start.sh" ]
