#!/bin/bash
batopkgs=( $(find $HOME/batocera.se/package -type f -name "*.mk" ) )

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
	for ((i=0; i<${#batopkgs[@]}; i++)); do
		f=( $(basename "${batopkgs[$i]}" .mk ) )
		echo "removing rpi4 package: "$f
		rm -rf $HOME/build-dir/batocera.rpi4/build/$f-*
		rm -rf $HOME/build-dir/batocera.rpi4/build/host-$f-*
	done
fi

if [ $BUILD_X86 = '1' ]; then
	for ((i=0; i<${#batopkgs[@]}; i++)); do
		f=( $(basename "${batopkgs[$i]}" .mk ) )
		echo "removing x86_64 package: "$f
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
    echo "Cleaning: "$i
	find $HOME/build-dir/batocera.$i/build -maxdepth 1 -type d -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2
	find $HOME/build-dir/batocera.$i/build -maxdepth 1 -type d -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2 | xargs rm -rf
done

#find $HOME/dl -maxdepth 2 -type f -name "*.zip" -o -name "*.tar.*" -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+(\.zip|\.tar\.[2a-z]+)$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2 | xargs rm -rf

