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

mkdir -p "${BATOCERA_BINARIES_DIR}/boot/boot" || exit 1
mkdir -p "${BATOCERA_BINARIES_DIR}/boot/overlays" || exit 1

cp -pr "${BINARIES_DIR}/rpi-firmware/"* "${BATOCERA_BINARIES_DIR}/boot/" || exit 1
cp -f  "${BUILD_DIR}/linux-custom/arch/arm/boot/dts/overlays/"*.dtbo "${BATOCERA_BINARIES_DIR}/boot/overlays" || exit 1
cp -f  "${BUILD_DIR}"/rpi-firmware-*/boot/*rpi-3-*.dtb           "${BATOCERA_BINARIES_DIR}/boot/" || exit 1
cp -f  "${BUILD_DIR}"/rpi-firmware-*/boot/bcm2710-rpi-zero-2.dtb "${BATOCERA_BINARIES_DIR}/boot/" || exit 1
cp     "${BOARD_DIR}/boot/config.txt"      "${BATOCERA_BINARIES_DIR}/boot/" || exit 1
cp     "${BOARD_DIR}/boot/config.txt"      "${BATOCERA_BINARIES_DIR}/boot/config_piboy.txt" || exit 1
cp     "${BOARD_DIR}/boot/config_rpi3.txt" "${BATOCERA_BINARIES_DIR}/boot/" || exit 1
cp     "${BOARD_DIR}/boot/fan.ini"         "${BATOCERA_BINARIES_DIR}/boot/" || exit 1
cp     "${BOARD_DIR}/boot/cmdline.txt"     "${BATOCERA_BINARIES_DIR}/boot/" || exit 1
cp     "${BOARD_DIR}/boot/README!.txt"     "${BATOCERA_BINARIES_DIR}/boot/" || exit 1

cp     "${BINARIES_DIR}/Image"             "${BATOCERA_BINARIES_DIR}/boot/boot/linux"           || exit 1
cp     "${BINARIES_DIR}/initrd.gz"         "${BATOCERA_BINARIES_DIR}/boot/boot/"                || exit 1
cp     "${BINARIES_DIR}/rootfs.squashfs"   "${BATOCERA_BINARIES_DIR}/boot/boot/batocera.update" || exit 1

exit 0
