#!/bin/bash
export NCURSES_NO_UTF8_ACS=1

function installer-menu() { 
local choice while true; 
do choice=$(dialog --backtitle "$BACKTITLE" --title " Installer" \ --ok-label Select --cancel-label Back \ --menu "MoviePlayer Install Menu " 30 70 50 \
1 "Install MoviePlayer" \
3 "MoviePlayer Info.  " \
2>&1 >/dev/tty) 

case "$choice" in 
1) install ;; 
3) movie-info ;;
*) break 
;; esac done
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
cd /etc/emulationstation
echo "Moving your es_systems.cfg to backups/es_systems.old"
sleep 2
clear
mkdir ~/backups
sudo mv es_systems.cfg ~/backups/es_systems.old
clear 
--yesno "Would You Like To Overwrite ES Systems Config?" 0 0 )
then edit-yes 
else edit-no
}

function edit-yes() {
wget . . . . . . . . .. . . es-systems.cfg
echo "Installing MPV"
sudo apt-get -y install mpv
sleep 2
echo " Install Complete! Rebooting Now" 
sleep 5
sudo reboot now
}

function edit-no() {
echo "Installing MPV"
sudo apt-get -y install mpv
sleep 2
echo " Install Complete! Rebooting Now" 
sleep 5
sudo reboot now
}

function movie-info() { 
### mesage box info ###
}

installer-menu


