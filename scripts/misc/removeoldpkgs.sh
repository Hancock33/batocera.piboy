# Cleanup
cleanup="aarch32
x86_wow64
rpi4
x86_64"

RED="\e[1;31m"
ENDCOLOR="\e[0m"
STARTLINE="\e[1;44m--------------------------------------------------\n"
ENDLINE="\n--------------------------------------------------"${ENDCOLOR}
clear
echo  ${STARTLINE}"Removing old packages                             "${ENDLINE}

for i in $cleanup
do
	echo "Cleaning: "${RED}$i${ENDCOLOR}
	find $HOME/build-dir/batocera.$i/build -maxdepth 1 -type d -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2
	find $HOME/build-dir/batocera.$i/build -maxdepth 1 -type d -printf '%T@ %p %f\n' | sed -r 's:\-[0-9a-f\.]+$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2 | xargs rm -rf
done

find $HOME/dl -maxdepth 2 -type f -name "*.zip" -o -name "*.tar.*" -printf '%T@ %p %f\n' | sed -r 's:\-[-_0-9a-fvrgit\.]+(\.zip|\.tar\.[2a-z]+)$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2
find $HOME/dl -maxdepth 2 -type f -name "*.zip" -o -name "*.tar.*" -printf '%T@ %p %f\n' | sed -r 's:\-[-_0-9a-fvrgit\.]+(\.zip|\.tar\.[2a-z]+)$$::' | sort -k3 -k1 | uniq -f 2 -d | cut -d' ' -f2 | xargs rm -rf
