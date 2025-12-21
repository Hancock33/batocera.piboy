GREEN="\e[1;32m"
RED="\e[1;31m"
BLUE="\e[1;34m"
YELLOW="\e[1;33m"
ENDCOLOR="\e[0m"

clear
echo ${BLUE}"----------------------------------------------------------------------------------------"
echo "Making Patches..."
echo "----------------------------------------------------------------------------------------"${ENDCOLOR}
echo ""

echo '*.rej' >> .gitignore
echo '*.orig' >> .gitignore
git add .
git commit -m gitignore

for file in /tmp/patches/*.patch; do
	echo ${BLUE}"----------------------------------------------------------------------------------------"
	echo "Using file $file"
	echo "----------------------------------------------------------------------------------------"${ENDCOLOR}
	git stash &&
	patch -Np1 -i $file &&
	rm $file

	 echo ${GREEN}
		find . -type f -name "*.orig" -exec rm -v {} \;
	 echo ${RED}
		find . -type f -name "*.rej" -exec rm -v {} \;
	 echo ${ENDCOLOR}

	git add . &&
	git diff --cached > $file &&
	git commit -m $file
done
git stash
