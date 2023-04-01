#!/bin/bash
CURRENTDATE=`date +"%Y%m%d"`
DEST_DIR=/tmp/batocera-rpi4-32bit-libs-$CURRENTDATE

mkdir -p $DEST_DIR
mkdir -p $DEST_DIR/bin32
mkdir -p $DEST_DIR/share
cp -a ${TARGET_DIR}/usr/bin/{sorr,box86,gmloader}        $DEST_DIR/bin32	
cp -a ${TARGET_DIR}/usr/share/box86                      $DEST_DIR/share
cp -a ${TARGET_DIR}/usr/lib                              $DEST_DIR/lib32
cp -a ${TARGET_DIR}/lib/*                                $DEST_DIR/lib32
ln -sf libblkid.so.1                                     $DEST_DIR/lib32/libblkid.so
ln -sf libmount.so.1                                     $DEST_DIR/lib32/libmount.so
ln -sf libsmartcols.so.1                                 $DEST_DIR/lib32/libsmartcols.so
ln -sf libudev.so.1                                      $DEST_DIR/lib32/libudev.so
rm -rf $DEST_DIR/lib32/{gconv,glslang,python3.*,terminfo,udev,xorg}
mv $DEST_DIR/lib32/dri                                 $DEST_DIR/lib32/dri.old
mkdir -p $DEST_DIR/lib32/dri
mv $DEST_DIR/lib32/dri.old/{v3d_dri.so,vc4_dri.so}     $DEST_DIR/lib32/dri
rm -r $DEST_DIR/lib32/dri.old
cd $DEST_DIR && tar -Jcf $DEST_DIR.tar.xz .
rm -r $DEST_DIR
cp -av $DEST_DIR.tar.xz /mnt/smb
mv $DEST_DIR.tar.xz  $HOME/dl/lib32bit

