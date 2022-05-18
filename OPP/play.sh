omxplayer -o alsa "$(cat /dev/shm/temp.vid)" > /dev/null 2>&1
pkill -CONT mpg123 > /dev/null 2>&1
