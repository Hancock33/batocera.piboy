#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
GREEN="\e[1;32m"
RED="\e[1;31m"
ENDCOLOR="\e[0m"
STARTLINE="\e[1;44m--------------------------------------------------\n"
ENDLINE="\n--------------------------------------------------"${ENDCOLOR}
clear
echo -e ${STARTLINE}"Removing Batocera Subsystem Packages              "${ENDLINE}

batoall=( $(find $HOME/batocera.se/package/batocera -type f -name "*.mk" | sort -k3 -k1 ) )

# Variables
BUILD_RPI=0
BUILD_X86=0

# Build RPI image
read -p "Clean Build AARCH32? (y/n)" yn
case $yn in
	y )
		BUILD_RPI=1;;
	n )
		BUILD_RPI=0;;
esac

# Build X86 image
read -p "Clean Build X86_WOW64? (y/n)" yn
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
		rm -rf $HOME/build-dir/batocera.aarch32/build/$f-*
		rm -rf $HOME/build-dir/batocera.aarch32/build/host-$f-*
	done
fi

if [ $BUILD_X86 = '1' ]; then
	for ((i=0; i<${#batoall[@]}; i++)); do
		f=( $(basename "${batoall[$i]}" .mk ) )
		echo -e "removing x86_64 package: "${RED}$f${ENDCOLOR}
		rm -rf $HOME/build-dir/batocera.x86_wow64/build/$f-*
		rm -rf $HOME/build-dir/batocera.x86_wow64/build/host-$f-*
	done
fi

# Cleanup
cleanup="aarch32
x86_wow64
rpi4
x86_64"

for i in $cleanup
do
	echo "Cleaning: "${RED}$i${ENDCOLOR}
	"${SCRIPT_DIR}/cleanup-old-packages.sh" "$HOME/build-dir/batocera.$i/build"
done

"${SCRIPT_DIR}/cleanup-old-packages.sh" --downloads "$HOME/dl"

