#!/bin/bash
export NCURSES_NO_UTF8_ACS=1

function installer-menu() {
local choice
while true
do choice=$(dialog --backtitle "$BACKTITLE" --title "O.P.P Installer V--1.11" \
    --ok-label Select --cancel-label Exit \
    --menu "O.P.P(Omx Player Pi ) Installer Menu " 20 40 20 \
    1 "Install/Update" \
    2 "O.P.P Info  " \
    3 "O.P.P Credits" \
    4 "Version Checker" \
    2>&1 >/dev/tty)

    case "$choice" in
    1) install ;;
    2) opp-info ;;
    3) credits ;;
    4) vcheck ;;
    *) break ;;
    esac
  done
}

function install() {
sudo rm -R "$HOME"/OPP
echo "Installing O.P.P Now "
sleep 3
clear
cd $HOME/RetroPie/roms/
mkdir movies
sudo chmod 755 -R movies
sleep 1
cd
mkdir OPP
cd OPP
sleep 1
wget https://raw.githubusercontent.com/Retro-Devils/O.P.P/main/OPP/OPP.sh
sleep 1
wget https://raw.githubusercontent.com/Retro-Devils/O.P.P/main/OPP/play.sh
sleep 1
wget https://raw.githubusercontent.com/Retro-Devils/O.P.P/main/README.md
sleep 1
wget https://github.com/Retro-Devils/O.P.P/raw/main/OPP/splash.mp4
sleep 1
wget https://raw.githubusercontent.com/Retro-Devils/O.P.P/main/OPP/opp-version.sh
sleep 1
chmod 755 -R $HOME/OPP
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
---TO CHANGE LAUNCH SCREEN REPLACE /home/pi/OPP/splash.mp4--- 
---ENJOY!!!!!!!!!----" 0 0
}

function opp-info() { 
dialog  --sleep 10 --title "O.P.P  INFO" --msgbox " 
- O.P.P stands for Omx Player Pi 
- O.P.P plays movies from RetroPie 
- Add your movies to .../roms/movies/
- Enjoy!!" 0 0
}

function credits() { 
dialog  --sleep 10 --title "O.P.P  Credits" --msgbox " 
- RapidEdwin (BigEd) 
- The Retro Devils " 0 0
}

function vcheck() {
dialog  --sleep 4 --title "VERSION CHECKER" --msgbox "
------OPP CURRENT VERSION----1.11-------
----------------------------------------
-OPP WILL NOW DISPLAY INSTALLED VERSION-
----------------------------------------
---IF THEY DO NOT MATCH PLEASE UPDATE---" 0 0
bash "$HOME"/pi/OPP/opp-version.sh
}


installer-menu
