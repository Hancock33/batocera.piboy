#!/bin/bash
CURRENTDATE=`date +"%Y%m%d"`
DEST_DIR=/tmp/batocera-rpi4-32bit-libs-$CURRENTDATE

mkdir -p $DEST_DIR/etc
mkdir -p $DEST_DIR/usr/bin32
cp -a ${TARGET_DIR}/etc/{binfmt.d,box86.box86rc}         $DEST_DIR/etc
cp -a ${TARGET_DIR}/usr/bin/{sorr,box86,gmloader}        $DEST_DIR/usr/bin32
cp -a ${TARGET_DIR}/usr/lib                              $DEST_DIR/usr/lib32
cp -a ${TARGET_DIR}/lib/*                                $DEST_DIR/usr/lib32
ln -sf libblkid.so.1                                     $DEST_DIR/usr/lib32/libblkid.so
ln -sf libudev.so.1                                      $DEST_DIR/usr/lib32/libudev.so
ln -sf /usr/lib32/pulseaudio/libpulsecommon-17.0.so      $DEST_DIR/usr/lib32/libpulsecommon-17.0.so

rm -rf $DEST_DIR/usr/lib32/firmware
rm -rf $DEST_DIR/usr/lib32/{gconv,gio,glslang,python3.*,terminfo,udev,xorg}

find $DEST_DIR -type f -name "*.a" -exec rm {} \;

cd $DEST_DIR && tar -cf $DEST_DIR.tar .
xz -T0 -7 -v $DEST_DIR.tar
rm -r $DEST_DIR
cp -av $DEST_DIR.tar.xz /mnt/smb
mv $DEST_DIR.tar.xz  $HOME/dl/lib32bit
