#!/bin/bash
CURRENTDATE=`date +"%Y%m%d"`
DEST_DIR=/tmp/batocera-x86-32bit-libs-$CURRENTDATE

mkdir -p $DEST_DIR/lib
mkdir -p $DEST_DIR/usr/bin32
mkdir -p $DEST_DIR/usr/share
cp -a ${TARGET_DIR}/usr/bin/gst-*                        $DEST_DIR/usr/bin32
cp -a ${TARGET_DIR}/usr/bin/{sorr,box86}                 $DEST_DIR/usr/bin32
cp -a ${TARGET_DIR}/usr/share/box86                      $DEST_DIR/usr/share
cp -a ${TARGET_DIR}/usr/share/vulkan                     $DEST_DIR/usr/share
cp -a ${TARGET_DIR}/usr/share/gst-plugins-base           $DEST_DIR/usr/share
cp -a ${TARGET_DIR}/usr/share/gstreamer-*                $DEST_DIR/usr/share
cp -a ${TARGET_DIR}/usr/wine                             $DEST_DIR/usr
cp -a ${TARGET_DIR}/usr/lib                              $DEST_DIR/usr/lib32
cp -a ${TARGET_DIR}/lib/*                                $DEST_DIR/usr/lib32
ln -sf libblkid.so.1                                     $DEST_DIR/usr/lib32/libblkid.so
ln -sf libmount.so.1                                     $DEST_DIR/usr/lib32/libmount.so
ln -sf libsmartcols.so.1                                 $DEST_DIR/usr/lib32/libsmartcols.so
ln -sf libudev.so.1                                      $DEST_DIR/usr/lib32/libudev.so
ln -sf libuuid.so.1                                      $DEST_DIR/usr/lib32/libuuid.so
ln -sf /usr/lib32                                        $DEST_DIR/lib32
ln -sf /usr/lib32/ld-linux.so.2                          $DEST_DIR/lib/ld-linux.so.2

rm -rf $DEST_DIR/usr/lib32/{avahi,gconv,glslang,graphene-1.0,icu,libfm,locale}
rm -rf $DEST_DIR/usr/lib32/{pcmanfm,python3.*,terminfo,udev,xorg,X11}
cd $DEST_DIR && tar -Jcf $DEST_DIR.tar.xz .
rm -r $DEST_DIR
cp -av $DEST_DIR.tar.xz /mnt/smb
mv $DEST_DIR.tar.xz  $HOME/dl/wine-x86

