function yt-player() { 
  local choice 
  
  while true; do
    choice=$(dialog --backtitle "$BACKTITLE" --title "YOUTUBE PLAYER" \
      ok-label GO --cancel-label Exit \
      --menu "CLICK GO AND TYPE YOUTUBE URL" 20 40 20 \
      1 " HOW TO USE YT-PLAYER" \
      2 " ENTER YOUTUBE URL" \
      2>&1 >/dev/tty)
      
     case "$choice" in
     1) how-to ;;
     2) type ;;
     *) break ;;
    esac
  done
}

function how-to() {
dialog --sleep 5 --title "HOW TO USE YT PLAYER" --msgbox " 
----CLICK ENTER YOUTUBE URL
----TYPE URL WITHOUT YOUTUBE.COM/
----THATS IT, ENJOY !!!" 0 0 \
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
      
