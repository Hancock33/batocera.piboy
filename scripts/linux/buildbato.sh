#!/bin/bash
echo "Generating configurations"
cd $HOME/batocera.se && 
git pull
git submodule init
git submodule update
./build.sh $HOME/build-dir/batocera.aarch32 aarch32-subsystem > /dev/null 2>&1
./build.sh $HOME/build-dir/batocera.rpi4 piboy4 > /dev/null 2>&1
./build.sh $HOME/build-dir/batocera.x86_64 x86_64 > /dev/null 2>&1
./build.sh $HOME/build-dir/batocera.x86_wow64 x86_wow64 > /dev/null 2>&1
rm -r $HOME/build-dir/batocera.*/build/batocera-system-* > /dev/null 2>&1
rm -r $HOME/build-dir/batocera.*/build/batocera-splash-* > /dev/null 2>&1
rm -r $HOME/build-dir/batocera.*/build/batocera-es-system-* > /dev/null 2>&1
rm -r $HOME/build-dir/batocera.*/build/batocera-configgen-* > /dev/null 2>&1

read -p "Clean Batocera packages? (y/n)" yn
case $yn in 
	y )
	    echo "Clean Batocera packages"
        rm -r $HOME/build-dir/batocera.*/build/batocera-a* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-b* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-c* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-d* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-e* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-g* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-i* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-notice* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-p* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-r* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-s* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-t* > /dev/null 2>&1
        rm -r $HOME/build-dir/batocera.*/build/batocera-w* > /dev/null 2>&1
        ;;
	n )
        echo "Moving on ..."
        ;;
esac

# Variables
BUILD_SUB=0
BUILD_RPI=0
BUILD_X86=0
make_sub_sys=""
make_distro=""

# Build subsystems
read -p "Build subsystems? (y/n)" yn
case $yn in 
	y )
        BUILD_SUB=1;;
	n )
        BUILD_SUB=0;;
esac

# Build RPI subsystems + distro
read -p "Build RPI? (y/n)" yn
case $yn in 
	y )
        BUILD_RPI=1;; 
	n )
        BUILD_RPI=0;;
esac

# Build X86 subsystems + distro
read -p "Build X86? (y/n)" yn
case $yn in 
	y )
        BUILD_X86=1;;
	n )
        BUILD_X86=0;;
esac

if [ $BUILD_X86 = '1' ]; then
	make_sub_sys="x86_wow64"
	make_distro="x86_64"
fi

if [ $BUILD_RPI = '1' ]; then
	make_sub_sys=$make_sub_sys" aarch32"
	make_distro=$make_distro" rpi4"
fi

# Build subsystems
if [ $BUILD_SUB = '1' ]; then
    for i in $make_sub_sys
    do
        echo "Building subsystem: "$i
        cd $HOME/build-dir/batocera.$i
        make -j33 > /dev/null
    done
fi

# Build Distro
for i in $make_distro
do
    echo "Building: "$i
    cd $HOME/build-dir/batocera.$i
    make -j33 > /dev/null
done

# Cleanup
cleanup="aarch32
x86_wow64
rpi4
x86_64"

for i in $cleanup
do
    echo "Cleaning: "$i
	find $HOME/build-dir/batocera.$i/build -maxdepth 1 -type d -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2 | xargs rm -rf
done

#find $HOME/dl -maxdepth 2 -type f -name "*.zip" -o -name "*.tar.*" -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+(\.zip|\.tar\.[2a-z]+)$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2 | xargs rm -rf
