function yt-player() { 
  local choice 
  
  while true; do
    choice=$(dialog --backtitle "$BACKTITLE" --title "YOUTUBE PLAYER" \
      ok-label GO --cancel-label Exit \
      --menu "CLICK GO AND TYPE YOUTUBE URL" 20 40 20 \
      1 " HOW TO USE YT-PLAYER" \
      2 " TYPE YOUTUBE URL" \
      2>&1 >/dev/tty)
      
     case "$choice" in
     1) how-to ;;
     2) type ;;
     *) break ;;
    esac
  done
}

function how-to() {
omxplayer -o alsa "$HOME"/RetroPie/retropiemenu/yt-player/how-to.mp4 
}

function type() {
echo "PLEASE TYPE URL AFTER YOUTUBE BELOW" 
echo
read -p "YOUTUBE.COM/" useranswer
echo
youtube-dl -g -f "$useranswer"
sleep 1
omxplayer -o alsa "$useranswer"
}

yt-player
      
