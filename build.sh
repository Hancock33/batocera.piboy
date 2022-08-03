#!/bin/bash
# ./build.sh buiddir target i.e 
# ./build.sh $HOME/batocera.rpi4 piboy4
$PWD/configs/createDefconfig.sh $PWD/configs/batocera-$2
make O=$1 BR2_EXTERNAL=$PWD -C $PWD/buildroot batocera-$2_defconfig
rm  $PWD/configs/batocera-$2_defconfig
echo "Output Dir:    $1"
echo "Buildroot Dir: $PWD/buildroot"
echo "Target:        $2"