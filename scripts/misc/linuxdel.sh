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
pd-mapper*
qrtr*
r81*
rmtfs*
rtl*
tqftpserv*
aelightgun*
aimtrak-guns*
anbernic-gpio-pad*
ayn-platform-*
batocera-gun-calibrator*
batocera-wheel-calibrator*
db9_gpio_rpi*
dolphinbar-guns*
dolphinCrosshairsPack*
fun-r1-gamepad*
fusion-lightguns*
gamecon_gpio_rpi*
gun4ir-guns*
guncon*
hid-nx*
input-wrapper*
jammasd*
joycond*
lightguns-games-precalibrations*
new-lg4ff*
qtsixa*
qtsixa-shanwan*
retrogame*
retroshooter-guns*
samco-guns*
sdl2-gamecontrollerdb*
sinden-guns*
steamdeckgun*
uinput-joystick*
umtool*
wiimote-3rdparty*
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
    sudo rm -rf $HOME/build-dir/batocera.rpi4/target/lib/modules/6.*
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
