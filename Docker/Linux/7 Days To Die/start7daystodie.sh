#!/bin/bash
set -e

steamcmd +login anonymous +force_install_dir /home/steam/server +app_update 294420 +quit
echo "Starting Server... Output are redirected to your log file in your data directory!"
export LD_LIBRARY_PATH=.
./server/7DaysToDieServer.x86_64 -logfile /home/steam/.local/share/7DaysToDie/serverlog__`date +%Y-%m-%d__%H-%M-%S`.txt -configfile=/home/steam/server/serverconfig.xml -quit -batchmode -nographics -dedicated
