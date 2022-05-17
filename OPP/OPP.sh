#!/bin/bash
if [ -f "$HOME/RetroPie/retropiemenu/imp/Pause.sh" ]; then
bash "$HOME"/RetroPie/retropiemenu/imp/Pause.sh
sleep 1 
echo "$1"> /dev/shm/temp.vid
sudo /home/pi/RetroPie-Setup/retropie_packages.sh retropiemenu launch $HOME/OPP/play.sh
else
echo "$1"> /dev/shm/temp.vid
sudo $HOME/RetroPie-Setup/retropie_packages.sh retropiemenu launch $HOME/OPP/play.sh
fi
