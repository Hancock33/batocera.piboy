#!/bin/bash
if [[ $1 == "" ]]; then
    echo 'This script requires two arguments, the frist been the output directory and the'
    echo 'second been the target. For example...'
	echo
    echo './build.sh $HOME/batocera.rpi4 rpi4'
	echo	
	echo 'You can list the targets with ./build list-targets argument'	
    exit 0

elif [[ $1 == "list-targets" ]]; then
	find $PWD/configs/ -name 'b*' | sed -n 's/.*\/batocera-\(.*\).board/\1/p' | sort

elif [[ $2 != "" ]]; then
	$PWD/configs/createDefconfig.sh $PWD/configs/batocera-$2
	make O=$1 BR2_EXTERNAL=$PWD -C $PWD/buildroot batocera-$2_defconfig
	rm  $PWD/configs/batocera-$2_defconfig
	echo "Output Dir:    $1"
	echo "Buildroot Dir: $PWD/buildroot"
	echo "Target:        $2"
fi
