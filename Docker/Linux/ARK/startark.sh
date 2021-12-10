#!/bin/bash

set -e
steamcmd +login anonymous +force_install_dir /home/steam/server +app_update $GAMEID +quit
chown -R "steam:steam" "/home/steam/server"

echo ${MAP}
echo $SERVERNAME

ulimit -n 100000
./server/ShooterGame/Binaries/Linux/ShooterGameServer ${MAP}?listen?SessionName=${SERVERNAME}?Multihome=${MULTIHOMEIP}?MaxPlayers=${MAXPLAYERS}?Port=${PORTGAME}?QueryPort=${PORTQUERY}?RCONEnabled=${RCONON}?RCONPort=${PORTRCON} -ClusterDirOverride=${DIRCLUSTER} -clusterid=${CLUSTERID}  -server -log -automanagedmods
