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
aic8800*
ayaneo-platform*
ayn-platform*
batman-adv*
*-nvidia*
cryptodev-linux*
dahdi-linux*
db9_gpio_rpi*
dtbocfg*
emlog*
esp-hosted*
falcosecurity-libs*
fwts*
gamecon_gpio_rpi*
gcnano-binaries*
guncon*
guncon3*
hid-nx*
hid-t150*
igh-ethercat*
kernel-module-imx-gpu-viv*
libargtable2*
linux-backports*
lttng-modules*
mali-driver*
mdio-tools*
new-lg4ff*
nvidia-driver*
openvmtools*
owl-linux*
r81*
rtl8*
ryzen*
v4l2loopback*
wilc-driver*
wireguard-linux-compat*
xone*
xpadneo*
xpad-noone*
xr819-xradio*
zfs*
nvidia-*"

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
		sudo rm -rf $HOME/build-dir/batocera.aarch32/build/$i
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
		sudo rm -rf $HOME/build-dir/batocera.x86_wow64/build/$i
	done
fi
