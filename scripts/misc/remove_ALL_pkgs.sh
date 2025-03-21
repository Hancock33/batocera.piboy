#!/bin/bash
GREEN="\e[1;32m"
RED="\e[1;31m"
ENDCOLOR="\e[0m"
STARTLINE="\e[1;44m--------------------------------------------------\n"
ENDLINE="\n--------------------------------------------------"${ENDCOLOR}
clear
echo -e ${STARTLINE}"Removing Batocera Packages                        "${ENDLINE}

batoall=( $(find $HOME/batocera.se/package/batocera -type f -name "*.mk" | sort -k3 -k1 ) )

# Variables
BUILD_RPI=0
BUILD_X86=0

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

if [ $BUILD_RPI = '1' ]; then
	for ((i=0; i<${#batoall[@]}; i++)); do
		f=( $(basename "${batoall[$i]}" .mk ) )
		echo -e "removing rpi4 package: "${RED}$f${ENDCOLOR}
		rm -rf $HOME/build-dir/batocera.rpi4/build/$f-*
		rm -rf $HOME/build-dir/batocera.rpi4/build/host-$f-*
	done
fi

if [ $BUILD_X86 = '1' ]; then
	for ((i=0; i<${#batoall[@]}; i++)); do
		f=( $(basename "${batoall[$i]}" .mk ) )
		echo -e "removing x86_64 package: "${RED}$f${ENDCOLOR}
		rm -rf $HOME/build-dir/batocera.x86_64/build/$f-*
		rm -rf $HOME/build-dir/batocera.x86_64/build/host-$f-*
	done
fi

# Cleanup
cleanup="aarch32
x86_wow64
rpi4
x86_64"

for i in $cleanup
do
    echo -e "Cleaning: "${RED}$i${ENDCOLOR}
	find $HOME/build-dir/batocera.$i/build -maxdepth 1 -type d -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2
	find $HOME/build-dir/batocera.$i/build -maxdepth 1 -type d -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2 | xargs rm -rf
done

find $HOME/dl -maxdepth 2 -type f -name "*.zip" -o -name "*.tar.*" -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+(\.zip|\.tar\.[2a-z]+)$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2 | xargs rm -rf

