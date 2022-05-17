omxplayer -o alsa "$(cat /dev/shm/temp.vid)" > /dev/null 2>&1
if [ -f "$HOME/RetroPie/retropiemenu/imp/Play.sh" ]; then
bash "$HOME"/RetroPie/retropiemenu/imp/Play.sh
else
sleep 1
fi
