#!/bin/bash

set -e

steamcmd +login anonymous +force_install_dir /home/steam/server +app_update 1690800 +quit

/home/steam/server/FactoryServer.sh
