#!/bin/bash

set -e

steamcmd +login anonymous +force_install_dir /home/steam/server +app_update 1690800 +quit

mkdir -p /home/steam/server/FactoryGame/Saved
mkdir -p /home/steam/server/FactoryGame/Saved/config
mkdir -p /home/steam/server/FactoryGame/Saved/SaveGames
mkdir -p /home/steam/server/FactoryGame/Saved/SaveGames/server

cp /home/steam/Engine.ini /home/steam/server/FactoryGame/Saved/config/Engine.ini

/home/steam/server/FactoryServer.sh
