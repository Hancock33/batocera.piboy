#!/bin/bash

# HOST_DIR = host dir
# BOARD_DIR = board specific dir
# BUILD_DIR = base dir/build
# BINARIES_DIR = images dir
# TARGET_DIR = target dir
# BATOCERA_BINARIES_DIR = batocera binaries sub directory

HOST_DIR=$1
BOARD_DIR=$2
BUILD_DIR=$3
BINARIES_DIR=$4
TARGET_DIR=$5
BATOCERA_BINARIES_DIR=$6

mkdir -p "${BATOCERA_BINARIES_DIR}/boot/boot"     || exit 1
mkdir -p "${BATOCERA_BINARIES_DIR}/boot/extlinux" || exit 1

"${HOST_DIR}/bin/mkimage" -A arm -O linux -T kernel -C none -a 0X41000000 -e 0X41000000 -n linux -d "${BINARIES_DIR}/Image" "${BATOCERA_BINARIES_DIR}/boot/boot/uImage" || exit 1
#cp "${BINARIES_DIR}/Image"           "${BATOCERA_BINARIES_DIR}/boot/boot/linux"           || exit 1
cp "${BINARIES_DIR}/uInitrd"      "${BATOCERA_BINARIES_DIR}/boot/boot/uInitrd"      || exit 1
cp "${BINARIES_DIR}/rootfs.squashfs" "${BATOCERA_BINARIES_DIR}/boot/boot/batocera.update" || exit 1

cp "${BINARIES_DIR}/sun55i-t527-orangepi-4a.dtb" "${BATOCERA_BINARIES_DIR}/boot/boot/"     || exit 1
cp "${BOARD_DIR}/boot/extlinux.conf"             "${BATOCERA_BINARIES_DIR}/boot/extlinux/" || exit 1

exit 0
