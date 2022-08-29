#!/bin/bash
pkill -f -STOP BGM.py
echo "$1"> /dev/shm/temp.vid
sudo $HOME/RetroPie-Setup/retropie_packages.sh retropiemenu launch $HOME/OPP/play.sh
