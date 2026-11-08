#!/bin/bash
GREEN="\e[1;32m"
RED="\e[1;31m"
ENDCOLOR="\e[0m"
STARTLINE="\e[1;44m--------------------------------------------------\n"
ENDLINE="\n--------------------------------------------------"${ENDCOLOR}
clear
echo -e ${STARTLINE}"Checking Batocera Packages                        "${ENDLINE}

batoall=( $(find $HOME/batocera.se/package/batocera -type f -name "*.mk" | sort -k3 -k1 ) )

	for ((i=0; i<${#batoall[@]}; i++)); do
		f=( $(dirname "${batoall[$i]}" .mk ) )
		echo "------------------------------------------------------------"
		echo -e "checking package: "$f
		echo "------------------------------------------------------------"
		cd $f && /home/lee/batocera.se/buildroot/utils/check-package -b *.in  && /home/lee/batocera.se/buildroot/utils/check-package -b *.mk
	done

