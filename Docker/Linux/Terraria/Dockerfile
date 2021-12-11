# Terraria 
#
# https://github.com/thelamescriptkiddiemax/
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Base Image 
FROM ubuntu:21.04
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
RUN mkdir -p /home/terraria/download \
    apt-get update && \
    apt-get install -y curl zip && \
    curl -sL https://www.terraria.org/api/download/pc-dedicated-server/terraria-server-1432.zip --output /home/terraria/download/server.zip && \
    unzip -q /home/terraria/download/server.zip -d /home/terraria/download \
    mv /home/terraria/download/1432/Linux/* /home/terraria

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Persistent Data
VOLUME /home/terraria

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Expose Ports
EXPOSE $PORTGAME/tcp

#-----------------------------------------------------------------------------------------------------------------------------------------------------------

# Start Ark Server
CMD [ "/home/steam/start.sh" ]
