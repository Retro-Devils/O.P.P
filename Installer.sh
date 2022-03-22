#!/bin/bash
export NCURSES_NO_UTF8_ACS=1

function installer-menu() {
local choice
while true
do choice=$(dialog --backtitle "$BACKTITLE" --title " Installer" \
    --ok-label Select --cancel-label Back \
    --menu "MoviePlayer Install Menu " 30 70 50 \
    1 "Install MoviePlayer" \
    2 "MoviePlayer Info.  " \
    2>&1 >/dev/tty)

    case "$choice" in
    1) install ;;
    2) movie-info ;;
    *) break ;;
    esac
  done
}

function install() {
echo "Setting up Files and Folders"
sleep 5 
clear
cd /opt/retropie/configs
sudo mkdir video
cd video
sudo wget https://raw.githubusercontent.com/Retro-Devils/movieplayer/main/video/emulators.cfg
cd
cd /home/pi/RetroPie/roms
sudo mkdir videos
sudo chmod -R 777 videos
cd
sudo chown -R pi:pi /home/pi/RetroPie/roms
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
### mesage box info ###
echo "do somthine here!"
}

installer-menu
