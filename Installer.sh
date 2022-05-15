#!/bin/bash
export NCURSES_NO_UTF8_ACS=1

function installer-menu() {
local choice
while true
do choice=$(dialog --backtitle "$BACKTITLE" --title " Installer" \
    --ok-label Select --cancel-label Back \
    --menu "O.P.P Install Menu " 30 70 50 \
    1 "Install O.P.P" \
    2 "O.P.P Info.  " \
    2>&1 >/dev/tty)

    case "$choice" in
    1) install ;;
    2) romp-info ;;
    *) break ;;
    esac
  done
}

function install() {
echo "Installing MPV Player"
if sudo apt-get --simulate install mpv; then sudo apt-get install -y mpv; else
	echo "Unable to install mpv, please update your system (\"sudo apt-get update && sudo apt-get upgrade\") and then try running this script again!"
	exit; fi
sleep 2
echo "Setting up Files and Folders"
sleep 5 
clear
cd $HOME/RetroPie/roms/
mkdir movies
sudo chmod -R 777 movies
cd

#### I STOPPED HERE ######
####
sleep 2
clear
if [ ! -s "/opt/retropie/configs/all/emulationstation/es_systems.cfg" ]; then sudo rm -f /opt/retropie/configs/all/emulationstation/es_systems.cfg; fi
if [ ! -f "/opt/retropie/configs/all/emulationstation/es_systems.cfg" ]; then sudo cp /etc/emulationstation/es_systems.cfg /opt/retropie/configs/all/emulationstation/es_systems.cfg; sudo chown pi:pi /opt/retropie/configs/all/emulationstation/es_systems.cfg; else cp -f /opt/retropie/configs/all/emulationstation/es_systems.cfg /opt/retropie/configs/all/emulationstation/es_systems.cfg.old; fi
CONTENT1="\t<system>\n\t\t<name>Videos</name>\n\t\t<fullname>Videos</fullname>\n\t\t<path>/home/pi/RetroPie/roms/videos</path>\n\t\t<extension>.avi .AVI .mp4 .MP4 .mov .MOV</extension>\n\t\t<command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ video %ROM%</command>\n\t\t<platform>videos</platform>\n\t\t<theme>videos</theme>\n\t</system>"
C1=$(echo $CONTENT1 | sed 's/\//\\\//g')
if grep -q Videos "/opt/retropie/configs/all/emulationstation/es_systems.cfg"; then echo "es_systems.cfg entry confirmed"
else
	sed "/<\/systemList>/ s/.*/${C1}\n&/" /opt/retropie/configs/all/emulationstation/es_systems.cfg > $HOME/temp
	cat $HOME/temp > /opt/retropie/configs/all/emulationstation/es_systems.cfg
	rm -f $HOME/temp
fi
}

function movie-info() { 
dialog  --sleep 1 --title "O.P.P  INFO" --msgbox " 
O.P.P stands for OmxPlayer Pi 
- OPP plays movies from RetroPie 
- Add your movies to ...roms/movies/
- Enjoy!!" 0 0
}

installer-menu
