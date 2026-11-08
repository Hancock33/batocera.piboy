#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)

GREEN="\e[1;32m"
RED="\e[1;31m"
ENDCOLOR="\e[0m"
STARTLINE="\e[1;44m--------------------------------------------------\n"
ENDLINE="\n--------------------------------------------------"${ENDCOLOR}
clear
echo -e ${STARTLINE}"Removing Batocera Packages                        "${ENDLINE}

batowine=( $(find $HOME/batocera.se/package/batocera/wine -type f -name "*.mk" | sort -k3 -k1 ) )
#batowineextras=( $(find $HOME/batocera.se/package/batocera/wine/extras -type f -name "*.mk" | sort -k3 -k1 ) )

# Variables
BUILD_X86=0

# Build X86 image
read -p "Clean Wine Build X86? (y/n)" yn
case $yn in
	y )
		BUILD_X86=1;;
	n )
		BUILD_X86=0;;
esac

if [ $BUILD_X86 = '1' ]; then
	for ((i=0; i<${#batowine[@]}; i++)); do
		f=( $(basename "${batowine[$i]}" .mk ) )
		echo -e "removing x86_64 package: "${RED}$f${ENDCOLOR}
		rm -rf $HOME/build-dir/batocera.x86_64/build/$f-*
		rm -rf $HOME/build-dir/batocera.x86_64/build/host-$f-*
		rm -rf $HOME/build-dir/batocera.x86_wow64/build/$f-*
		rm -rf $HOME/build-dir/batocera.x86_wow64/build/host-$f-*
	done

	rm -rf $HOME/build-dir/batocera.x86_64/build/wine*
	rm -rf $HOME/build-dir/batocera.x86_64/build/batocera-wine*
	rm -rf $HOME/build-dir/batocera.x86_64/target/usr/wine
	rm -rf $HOME/build-dir/batocera.x86_wow64/target/usr/wine
fi

# Cleanup
cleanup="x86_wow64
x86_64"

for i in $cleanup
do
	echo -e "Cleaning: "${RED}$i${ENDCOLOR}
	"${SCRIPT_DIR}/cleanup-old-packages.sh" "$HOME/build-dir/batocera.$i/build"
done

"${SCRIPT_DIR}/cleanup-old-packages.sh" --downloads "$HOME/dl"

