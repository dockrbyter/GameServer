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
    mkdir -p /terraria/data

ADD https://www.terraria.org/api/download/pc-dedicated-server/terraria-server-1432.zip /terraria/setup/
ADD . /terraria/data

WORKDIR /terraria/setup

RUN apk update && \
    apk upgrade && \
    apk search zip && \
    apk add zip && \
    unzip *.zip -d /terraria/setup && \
    mv -v /terraria/setup/1432/Linux/* /terraria && \
    chmod +x /terraria/data/start.sh

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Persistent Data
VOLUME /terraria
VOLUME ~/.local/share/Terraria/Worlds

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Expose Ports
EXPOSE $PORTGAME/tcp

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Start Terraria Server
#CMD ["sh", "/terraria/data/start.sh" ]

