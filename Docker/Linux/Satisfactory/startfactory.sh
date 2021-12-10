#!/bin/bash

set -e

steamcmd +login anonymous +force_install_dir /home/steam/server +app_update 1690800 +quit
chown -R "steam:steam" "/home/steam/server"

/home/steam/server/FactoryServer.sh -multihome=0.0.0.0 -Port=7779
