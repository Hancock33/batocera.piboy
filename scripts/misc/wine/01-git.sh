find /home/lee/github/wine-tkg-batocera ! -type d -name '.git' -type f -exec rm -rf {} +
cd /home/lee/github/wine-tkg-batocera && find -maxdepth 1 -type d ! -name '.git' -exec rm -rf {} \;
cd /home/lee/github/wine-tkg-batocera && find -maxdepth 1 -type f ! -name '.gitattributes' -exec rm -rf {} \;
mkdir -p /home/lee/github/wine-tkg-batocera/custom
find /tmp/wine-tkg/src/wine-git -name '.git*' -type f -exec rm -rf {} +
cd /home/lee/github/wine-tkg-git/wine-tkg-git
cp -a /tmp/wine-tkg/src/wine-git/* /home/lee/github/wine-tkg-batocera
cp -f customization.cfg last_build_config.log prepare.log /home/lee/github/wine-tkg-batocera/custom
cp -a /home/lee/github/batocera.tkg-wine /home/lee/github/wine-tkg-batocera/batocera
rm -rf /home/lee/github/wine-tkg-batocera/autom4te.cache
rm -rf /home/lee/github/wine-tkg-batocera/configure~
find /home/lee/github/wine-tkg-batocera -type f -name "*.orig" -exec rm -v {} \;
find /home/lee/github/wine-tkg-batocera -type f -name "*.rej" -exec rm -v {} \;
