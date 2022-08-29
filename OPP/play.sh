pkill -f -STOP BGM.py
omxplayer -o alsa "$(cat /dev/shm/temp.vid)" > /dev/null 2>&1
