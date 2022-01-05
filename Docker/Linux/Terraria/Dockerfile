# Terraria 
#
# https://github.com/thelamescriptkiddiemax/
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Base Image 
FROM ubuntu
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Label
LABEL image.authors="Max"
LABEL description="Terraria Dedicated Server"
LABEL "other"="https://github.com/thelamescriptkiddiemax"
#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Environment Variables
ENV PORTGAME=27300

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Download Server Files
RUN mkdir -p /terraria/setup

ADD https://www.terraria.org/api/download/pc-dedicated-server/terraria-server-1432.zip /terraria/setup/

WORKDIR /terraria/setup

RUN apt update -y && \
    apt upgrade -y && \
    apt install zip -y && \
    unzip *.zip -d /terraria/setup && \
    mv -v /terraria/setup/1432/Linux/* /terraria

ADD . /terraria

WORKDIR /terraria

RUN chmod +x TerrariaServer.bin.x86* && \
    chmod +x start.sh

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Persistent Data
VOLUME /terraria
VOLUME ~/.local/share/Terraria/Worlds

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Expose Ports
EXPOSE $PORTGAME/tcp

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Start Terraria Server
CMD [ "bash", "./start.sh" ]