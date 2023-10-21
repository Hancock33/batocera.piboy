#!/bin/bash
delkern="linux-custom*
linux-6.*
linux-headers*
*-nvidia*
rtl*
r8125*
pd-mapper*
qrtr*
rmtfs*
tqftpserv*
aelightgun*
dolphinbar-guns*
gun4ir-guns*
lightguns-games-precalibrations*
sinden-guns*
wiimotes-rules*
xpadneo*
aimtrak-guns*
dolphinCrosshairsPack*
guncon*
qtsixa*
sinden-guns-libs*
xarcade2jstick*
xpad-noone*
batocera-gun-calibrator*
fun-r1-gamepad*
hid-nx*
qtsixa-shanwan*
uinput-joystick*
xone*
xpi_gamecon_rpi*
db9_gpio_rpi*
gamecon_gpio_rpi*
joycond*
retrogame*
umtool*
xow*"

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
        echo "Deleting: "$i
        sudo rm -r $HOME/build-dir/batocera.rpi4/build/$i
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
        echo "Deleting: "$i
        sudo rm -rf $HOME/build-dir/batocera.x86_64/build/$i
    done
fi
