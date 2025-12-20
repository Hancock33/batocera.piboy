#!/bin/bash
GREEN="\e[1;32m"
RED="\e[1;31m"
ENDCOLOR="\e[0m"
STARTLINE="\e[1;44m--------------------------------------------------\n"
ENDLINE="\n--------------------------------------------------"${ENDCOLOR}
clear
echo  ${STARTLINE}"Cleaning Batocera Subsystems                      "${ENDLINE}

cd $HOME/batocera.se &&
git pull
git submodule init
git submodule update
./build.sh $HOME/build-dir/batocera.aarch32 aarch32-subsystem > /dev/null 2>&1
./build.sh $HOME/build-dir/batocera.x86_wow64 x86_wow64 > /dev/null 2>&1

# Variables
BUILD_RPI=0
BUILD_X86=0
make_sub_sys=""

# Build RPI subsystems
read -p "Clean Build RPI? (y/n)" yn
case $yn in
	y )
		BUILD_RPI=1;;
	n )
		BUILD_RPI=0;;
esac

# Build X86 subsystems
read -p "Clean Build X86? (y/n)" yn
case $yn in
	y )
		BUILD_X86=1;;
	n )
		BUILD_X86=0;;
esac

if [ $BUILD_X86 = '1' ]; then
	make_sub_sys="x86_wow64"
fi

if [ $BUILD_RPI = '1' ]; then
	make_sub_sys=$make_sub_sys" aarch32"
fi

# Build selected subsystems
for i in $make_sub_sys
do
	echo "Removing Directories: "${RED}$i${ENDCOLOR}
	sudo rm -rf $HOME/build-dir/batocera.$i/host
	sudo rm -rf $HOME/build-dir/batocera.$i/images
	sudo rm -rf $HOME/build-dir/batocera.$i/staging
	sudo rm -rf $HOME/build-dir/batocera.$i/target

	echo "Removing Package Sources: "${RED}$i${ENDCOLOR}
	cd  $HOME/build-dir/batocera.$i/build && find -maxdepth 1 -type d ! -name 'host*' -a ! -name 'llvm-*' -exec rm -rf {} \;
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-skeleton*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-gcc-final-*/.stamp_built
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-libopenssl*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-perl-parse-yapp*

	echo "Removing Installed Packages: "${RED}$i${ENDCOLOR}
	sudo rm -rf $HOME/build-dir/batocera.$i/build/*/.stamp*_installed
done
