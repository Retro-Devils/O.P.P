#!/bin/bash
export NCURSES_NO_UTF8_ACS=1

function installer-menu() {
local choice
while true
do choice=$(dialog --backtitle "$BACKTITLE" --title "O.P.P Installer" \
    --ok-label Select --cancel-label Back \
    --menu "O.P.P Install Menu " 30 70 50 \
    1 "Install O.P.P" \
    2 "O.P.P Info  " \
    2>&1 >/dev/tty)

    case "$choice" in
    1) install ;;
    2) opp-info ;;
    *) break ;;
    esac
  done
}

function install() {
echo "Installing O.P.P Now "
sleep 3
clear
cd $HOME/RetroPie/roms/
mkdir movies
sudo chmod -R 755 ~/movies
sleep 1
cd
mkdir OPP
cd OPP
wget https://raw.githubusercontent.com/Retro-Devils/O.P.P/main/OPP/OPP.sh
wget https://raw.githubusercontent.com/Retro-Devils/O.P.P/main/OPP/play.sh
chmod 755 -R $HOME/OPP
sleep 1
cd
sudo cp $HOME/OPP/OPP.sh -f /usr/local/bin/OPP
sudo chmod 755 /usr/local/bin/OPP
sleep 1
dialog  --sleep 10 --title "POST INSTALL INSTRUCTIONS" --msgbox "
---PLEASE ADD THE FOLLOWING TO es_systems.cfg--- 
---Located at /home/pi/.emulationstation/---
  <system>
    <name>movies</name>
    <fullname>Movies</fullname>
    <path>/home/pi/RetroPie/roms/movies</path>
    <extension>.mp4 .MP4 .avi .AVI .mkv .MKV</extension>
    <command>$HOME/OPP/OPP.sh %ROM%</command>
    <platform>movies</platform>
    <theme>movies</theme>
  </system>
  
---ADD YOUR MOVIES TO /home/pi/RetroPie/roms/movies---
---ENJOY!!!!!!!!!----" 0 0 
}

function opp-info() { 
dialog  --sleep 10 --title "O.P.P  INFO" --msgbox " 
- O.P.P stands for Omx Player Pi 
- O.P.P plays movies from RetroPie 
- Add your movies to .../roms/movies/
- Enjoy!!" 0 0
}

installer-menu
