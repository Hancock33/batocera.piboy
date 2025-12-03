#!/bin/bash
GREEN="\e[1;32m"
RED="\e[1;31m"
ENDCOLOR="\e[0m"
STARTLINE="\e[1;44m--------------------------------------------------\n"
ENDLINE="\n--------------------------------------------------"${ENDCOLOR}
clear
echo  ${STARTLINE}"Cleaning Batocera Image(s)                        "${ENDLINE}

cd $HOME/batocera.se &&
git pull
git submodule init
git submodule update
./build.sh $HOME/build-dir/batocera.rpi4 piboy4 > /dev/null 2>&1
./build.sh $HOME/build-dir/batocera.x86_64 x86_64 > /dev/null 2>&1

# Variables
BUILD_RPI=0
BUILD_X86=0
make_bato=""

# Build RPI image
read -p "Clean Build RPI? (y/n)" yn
case $yn in
	y )
		BUILD_RPI=1;;
	n )
		BUILD_RPI=0;;
esac

# Build X86 image
read -p "Clean Build X86? (y/n)" yn
case $yn in
	y )
		BUILD_X86=1;;
	n )
		BUILD_X86=0;;
esac

if [ $BUILD_X86 = '1' ]; then
	make_bato="x86_64"
fi

if [ $BUILD_RPI = '1' ]; then
	make_bato=$make_bato" rpi4"
fi

# Build selected images
for i in $make_bato
do
	echo "Removing Directories: "${RED}$i${ENDCOLOR}
	sudo rm -rf $HOME/build-dir/batocera.$i/host
	sudo rm -rf $HOME/build-dir/batocera.$i/images
	sudo rm -rf $HOME/build-dir/batocera.$i/staging
	sudo rm -rf $HOME/build-dir/batocera.$i/target

	echo "Removing Installed Packages: "${RED}$i${ENDCOLOR}
	sudo rm -rf $HOME/build-dir/batocera.$i/build/*/.stamp*_installed

	echo "Removing Package Sources: "${RED}$i${ENDCOLOR}
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-skeleton*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-gcc-final-*/.stamp_built
	sudo rm -rf $HOME/build-dir/batocera.$i/build/gcc-final-*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-libopenssl*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/mesa3d*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/batocera-*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/gobject-introspection*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-perl-parse-yapp-*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/mupen64plus-core*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/libretro-core-info*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/redream-*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/scummvm-*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/adwaita-icon-theme-light*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/*firmware*
	# rpi
	sudo rm -rf $HOME/build-dir/batocera.$i/build/lib32bit-*
	# x86
	sudo rm -rf $HOME/build-dir/batocera.$i/build/syslinux*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/xbox-xcloud-client*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/wine-x86-*
done
