#!/bin/bash

set -e
steamcmd +login anonymous +force_install_dir /home/steam/server +app_update $GAMEID +quit
chown -R "steam:steam" "/home/steam/server"

ulimit -n 100000
./server/ShooterGame/Binaries/Linux/ShooterGameServer $MAP?listen?Multihome=$MULTIHOMEIP?SessionName=$SERVERNAME?MaxPlayers=$MAXPLAYERS?ServerPassword=$SERVERPW?ServerAdminPassword=$ADMINPW -ClusterDirOverride=$CLUSTERDIR -clusterid=$CLUSTERID -nosteamclient -server -log
