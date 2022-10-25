#!/bin/bash
export NCURSES_NO_UTF8_ACS=1

function installer-menu() {
local choice
while true
do choice=$(dialog --backtitle "$BACKTITLE" --title "O.P.P Installer V--1.12" \
    --ok-label Select --cancel-label Exit \
    --menu "O.P.P(Omx Player Pi ) Installer Menu " 40 40 30 \
    1 "<------>Install/Update<------>" \
    2 "<------>O.P.P Info<------>" \
    3 "<------>O.P.P Credits<------>" \
    4 "Version Checker" \
    - "__________        __                  " \
    - "\______   \ _____/  |________  ____   " \
    - " |       _// __ \   __\_  __ \/  _ \  " \
    - " |    |   \  ___/|  |  |  | \(  <_> ) " \
    - " |____|_  /\___  >__|  |__|   \____/  " \
    - "        \/     \/                     " \
    - "________              .__.__          " \
    - "\______ \   _______  _|__|  |   ______" \
    - " |    |  \_/ __ \  \/ /  |  |  /  ___/" \
    - " |    '   \  ___/\   /|  |  |__\___ \ " \
    - "/_______  /\___  >\_/ |__|____/____  >" \
    - "        \/     \/                  \/ " \
    2>&1 >/dev/tty)

    case "$choice" in
    1) install ;;
    2) opp-info ;;
    3) credits ;;
    4) vcheck ;;
    -) no ;;
    *) break ;;
    esac
  done
}

function install() {
if [ -d "$HOME/OPP" ]; then sudo rm -R "$HOME/OPP"; fi
echo "Installing O.P.P Now "
sleep 2
clear
if [ ! -d "$HOME/RetroPie/roms/movies" ]; then mkdir "$HOME/RetroPie/roms/movies"; chmod 755 -R $HOME/RetroPie/roms/movies; fi
sleep 1
mkdir $HOME/OPP
chmod 755 -R $HOME/OPP
sleep 1
wget https://github.com/Retro-Devils/O.P.P/raw/main/OPP/OPP.sh -P "$HOME/OPP"
sleep 1
wget https://github.com/Retro-Devils/O.P.P/raw/main/OPP/play.sh -P "$HOME/OPP"
sleep 1
wget https://github.com/Retro-Devils/O.P.P/raw/main/README.md -P "$HOME/OPP"
sleep 1
wget https://github.com/Retro-Devils/O.P.P/raw/main/OPP/splash.mp4 -P "$HOME/OPP"
sleep 1
wget https://github.com/Retro-Devils/O.P.P/raw/main/OPP/opp-version.sh -P "$HOME/OPP"
sleep 1
chmod 755 $HOME/OPP/*.sh
sleep 1
if [ ! -f "$HOME/.emulationstation/es_systems.cfg" ]; then sudo cp -f /etc/emulationstation/es_systems.cfg "$HOME/.emulationstation/"; fi
sleep 1
OPPCONTENT1="  <system>\n\t<name>movies</name>\n\t<fullname>Movies</fullname>\n\t<path>/home/pi/RetroPie/roms/movies</path>\n\t<extension>.mp4 .MP4 .avi .AVI .mkv .MKV</extension>\n\t<command>$HOME/OPP/OPP.sh %ROM%</command>\n\t<platform>movies</platform>\n\t<theme>movies</theme>\n  </system>"
OPPC1=$(echo $OPPCONTENT1 | sed 's/\//\\\//g')
if grep -q OPP.sh "$HOME/.emulationstation/es_systems.cfg"; then echo "Movies entry confirmed"
else
	sed "/<\/systemList>/ s/.*/${OPPC1}\n&/" "$HOME/.emulationstation/es_systems.cfg" > /tmp/temp1.cfg
	cat /tmp/temp1.cfg > "$HOME/.emulationstation/es_systems.cfg"
	rm -f /tmp/temp1.cfg
fi
sleep 2
dialog  --sleep 10 --title "POST INSTALL INSTRUCTIONS" --msgbox "
---ADD YOUR MOVIES TO /home/pi/RetroPie/roms/movies---
---TO CHANGE LAUNCH SCREEN REPLACE /home/pi/OPP/splash.mp4--- 
---RESTART EMULATIONSTATION FOR CHANGES AND ADDITIONS---
---TO TAKE EFFECT---
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
sleep 2
}

function vcheck() {
dialog  --sleep 4 --title "VERSION CHECKER" --msgbox "
------OPP CURRENT VERSION----1.12-------
----------------------------------------
-OPP WILL NOW DISPLAY INSTALLED VERSION-
----------------------------------------
---IF THEY DO NOT MATCH PLEASE UPDATE---" 0 0
bash "$HOME"/pi/OPP/opp-version.sh
}

installer-menu
