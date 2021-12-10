#!/bin/bash

set -e
steamcmd +login anonymous +force_install_dir /home/steam/server +app_update $GAMEID +quit
chown -R "steam:steam" "/home/steam/server"

ulimit -n 100000
./server/ShooterGame/Binaries/Linux/ShooterGameServer $MAP?listen?Multihome=$MULTIHOMEIP?SessionName=$SERVERNAME?MaxPlayers=$MAXPLAYERS?ServerAdminPassword=$ADMINPW?Port=$PORTGAME?QueryPort=$PORTQUERY?RCONEnabled=$RCONON?RCONPort=$PORTRCON?AltSaveDirectoryName=$DIRSAVE?ServerPassword=$SERVERPW -ClusterDirOverride=$DIRCLUSTER -clusterid=$CLUSTERID -nosteamclient -server -log -automanagedmods
