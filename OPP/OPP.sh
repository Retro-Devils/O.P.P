#!/bin/bash
pkill -STOP mpg123 > /dev/null 2>&1
echo "$1"> /dev/shm/temp.vid
omxplayer -o "$HOME"/OPP/splash.mp4
sudo $HOME/RetroPie-Setup/retropie_packages.sh retropiemenu launch $HOME/OPP/play.sh
