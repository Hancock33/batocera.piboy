#!/bin/bash
echo "Generating configurations"
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
	sudo rm -rf $HOME/build-dir/batocera.$i/build/batocera-*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/gobject-introspection*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/host-perl-parse-yapp-*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/mupen64plus-core*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/libretro-core-info*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/libretro-duckstation*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/scummvm-*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/adwaita-icon-theme-light*
	# x86
	sudo rm -rf $HOME/build-dir/batocera.$i/build/syslinux*
	sudo rm -rf $HOME/build-dir/batocera.$i/build/cemu*

	echo "Building Batocera: "$i
	cd $HOME/build-dir/batocera.$i
	make -j33 > /dev/null
done
