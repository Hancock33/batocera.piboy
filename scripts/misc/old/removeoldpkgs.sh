#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
CLEANUP_SCRIPT="${SCRIPT_DIR}/cleanup-old-packages.sh"
RED="\e[1;31m"
ENDCOLOR="\e[0m"
STARTLINE="\e[1;44m--------------------------------------------------\n"
ENDLINE="\n--------------------------------------------------"${ENDCOLOR}
clear
echo "${STARTLINE}Removing old packages                             ${ENDLINE}"

for i in aarch32 x86_wow64 rpi4 x86_64
do
	echo "Cleaning: ${RED}${i}${ENDCOLOR}"
	"${CLEANUP_SCRIPT}" "${HOME}/build-dir/batocera.${i}/build"
done

"${CLEANUP_SCRIPT}" --downloads "${HOME}/dl"
