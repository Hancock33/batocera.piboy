This image is setup to use the Experimental Pi DMG case, to run on a standalone RPI4/5 (i.e., not in the Experimental Pi DMG case) follow the steps below.

1.	Rename the file "config_rpi4.txt" to "config.txt" 
2.	In the batocera-boot.conf change the option "piboy.enabled=1" to "piboy.enabled=0"
3.	In the cmdline.txt remove "maxcpus=3" to enable all cpu cores

Have Fun!