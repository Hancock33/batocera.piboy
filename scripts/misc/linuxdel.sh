#!/bin/bash
GREEN="\e[1;32m"
RED="\e[1;31m"
ENDCOLOR="\e[0m"
STARTLINE="\e[1;44m--------------------------------------------------\n"
ENDLINE="\n--------------------------------------------------"${ENDCOLOR}
clear
echo  ${STARTLINE}"Cleaning Batocera Linux Kernel                    "${ENDLINE}

delkern="linux-custom*
linux-6.*
linux-headers*
*-nvidia*
aelightgun*
aimtrak-guns*
ayn-platform-*
batocera-gun-calibrator*
db9_gpio_rpi*
dolphinbar-guns*
dolphinCrosshairsPack*
fun-r1-gamepad*
gamecon_gpio_rpi*
gun4ir-guns*
guncon*
hid-nx*
joycond*
lightguns-games-precalibrations*
new-lg4ff*
pd-mapper*
qrtr*
qtsixa*
qtsixa-shanwan*
r81*
retrogame*
rmtfs*
rtl*
sinden-guns*
sinden-guns-libs*
tqftpserv*
uinput-joystick*
umtool*
wiimotes-rules*
xarcade2jstick*
xone*
xow*
xpadneo*
xpad-noone*
xpi_gamecon_rpi*"

read -p "Delete RPI Kerenl? (y/n)" yn
case $yn in 
	y )
        DEL_RPI4=1;;
	n )
        DEL_RPI4=0;;
esac

if [ $DEL_RPI4 = '1' ]; then
    sudo rm -r $HOME/build-dir/batocera.rpi4/target/lib/modules/6.*
    for i in $delkern
    do
        echo "Deleting: "${RED}$i${ENDCOLOR}
        sudo rm -rf $HOME/build-dir/batocera.rpi4/build/$i
    done
fi

read -p "Delete X86 Kerenl? (y/n)" yn
case $yn in 
	y )
        DEL_X86=1;;
	n )
        DEL_X86=0;;
esac

if [ $DEL_X86 = '1' ]; then
    sudo rm -rf $HOME/build-dir/batocera.x86_64/target/lib/modules/6.*
    for i in $delkern
    do
        echo "Deleting: "${RED}$i${ENDCOLOR}
        sudo rm -rf $HOME/build-dir/batocera.x86_64/build/$i
    done
fi
