BATOCERA FOR THE EXPERIMENTAL PI DMG CASE
==========================================

This image is set up for the Experimental Pi DMG case.

To run it on a standalone Raspberry Pi 4 or 5 (not in the DMG case), follow these steps:

1. Back up the existing "config.txt" (for example, rename it to "config_piboy.txt").
2. Rename "config_rpi.txt" to "config.txt".
3. Open "batocera-boot.conf" and change:
       piboy.enabled=1
   to:
       piboy.enabled=0

To go back to the DMG case, reverse the steps: restore your backed-up "config.txt" and set "piboy.enabled=1".

Have fun!