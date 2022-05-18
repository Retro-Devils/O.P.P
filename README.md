# O.P.P Info

- O.P.P. stands for Omx Player Pi.

- O.P.P. launches movies with joystick support right from RetropPie

- Current Version------1.10------May 17, 2022

# How To Use 

1. Run Install Script

2. Put your movies in home/pi/RetroPie/roms/movies/

3. Edit es_systems.cfg

4. Reload RetroPie

5. Press A on Movies then A on your movie

6. Enjoy!!

# Install 

Open terminal type 

curl -sSL bit.ly/Install-OPP | bash


# How does this work? 

This uses omxplayer, retropie setup menu script, and retropie. 

- Omxplayer plays Movies.

- Retropie setup menu script enables joystick support.
 
- Retropie of course launches the videos.


# Accepted Video Files 

.mp4 .mpv .avi 

# Troubleshooting 

- Video failed to launch? 
 
    - Remove spaces add - instead. 
    
        Example rename Superman 2022.mp4 to Superman-2022.mp4

    - Some video files just wont work, due to encoding issues.
 
# FAQ

- Can I add Folders like cartoons, movies ,etc?
 
 YEAP!!
 
- Does boxart and stuff work the same?

 Yes, you will need to copy or copy and edit a gamelist.xml for .../roms/movies. We use the movie itself as snap/preview video works great. 
 
- Can I Scrape the Movies with Scrapper?

  NO. Scrapper is looking for games not movies, all art will have to be be manually added.

# TO DO 

- Make a "Play All" button. To play everything in a folder . Example everything ..../roms/movies/cartoons/

- Make a "Stream Videos" Option/Button. choose a internet source and stream video from thier .


# Credits 

HUGE HUGE HUGE credit to RapidEdwin on github. He makes IMP(integrated movie player ) and this would not be possible without him .

# Changelog

- 1.00 to 1.10

        - Added IMP "support". Now when launch a video it will press pause on IMP music. When video ends it will press Play on IMP music.

        - Released few tested misc problems fixed. Mainly typos.  
