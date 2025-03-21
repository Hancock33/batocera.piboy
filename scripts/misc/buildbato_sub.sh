#!/bin/bash
GREEN="\e[1;32m"
RED="\e[1;31m"
ENDCOLOR="\e[0m"
STARTLINE="\e[1;44m--------------------------------------------------\n"
ENDLINE="\n--------------------------------------------------"${ENDCOLOR}
clear
echo  ${STARTLINE}"Building Batocera Image(s)                        "${ENDLINE}

cd $HOME/batocera.se &&
git pull
git submodule init
git submodule update
./build.sh $HOME/build-dir/batocera.aarch32 aarch32-subsystem > /dev/null 2>&1
./build.sh $HOME/build-dir/batocera.x86_wow64 x86_wow64 > /dev/null 2>&1
rm -rf $HOME/build-dir/batocera.*/build/batocera-system-* > /dev/null 2>&1
rm -rf $HOME/build-dir/batocera.*/build/batocera-splash-* > /dev/null 2>&1
rm -rf $HOME/build-dir/batocera.*/build/batocera-es-system-* > /dev/null 2>&1
rm -rf $HOME/build-dir/batocera.*/build/batocera-configgen-* > /dev/null 2>&1

read -p "Clean Batocera packages? (y/n)" yn
case $yn in
	y )
        rm -rf $HOME/build-dir/batocera.*/build/batocera-a* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-b* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-c* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-d* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-e* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-g* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-i* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-notice* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-p* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-r* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-s* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-t* > /dev/null 2>&1
        rm -rf $HOME/build-dir/batocera.*/build/batocera-w* > /dev/null 2>&1
        ;;
esac

# Variables
BUILD_SUB=0
BUILD_RPI=0
BUILD_X86=0
make_sub_sys=""

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
fi

if [ $BUILD_RPI = '1' ]; then
	make_sub_sys=$make_sub_sys" aarch32"
fi

# Build subsystems
if [ $BUILD_SUB = '1' ]; then
    for i in $make_sub_sys
    do
        echo "Building subsystem: "${GREEN}$i${ENDCOLOR}
        cd $HOME/build-dir/batocera.$i
        make -j33 > /dev/null
    done
fi

# Cleanup
cleanup="aarch32
x86_wow64"

for i in $cleanup
do
    echo "Cleaning: "${RED}$i${ENDCOLOR}
    find $HOME/build-dir/batocera.$i/build -maxdepth 1 -type d -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2 | xargs rm -rf
done

#find $HOME/dl -maxdepth 2 -type f -name "*.zip" -o -name "*.tar.*" -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+(\.zip|\.tar\.[2a-z]+)$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2 | xargs rm -rf
