#!/bin/bash
echo "Generating configurations"
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
	echo "Removing Directories: "$i
	sudo rm -rf $HOME/build-dir/batocera.$i/host
	sudo rm -rf $HOME/build-dir/batocera.$i/images
	sudo rm -rf $HOME/build-dir/batocera.$i/staging
	sudo rm -rf $HOME/build-dir/batocera.$i/target

	echo "Removing Installed Packages: "$i
	sudo rm -rf $HOME/build-dir/batocera.$i/build/*/.stamp*_installed

	echo "Removing Package Sources: "$i
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-skeleton*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-gcc-final-*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-libopenssl*

	#echo "Building Subsystem: "$i
	#cd $HOME/build-dir/batocera.$i
	#make -j33 > /dev/null
done
