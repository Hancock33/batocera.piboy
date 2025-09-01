#!/bin/bash
CURRENTDATE=`date +"%Y%m%d"`
DEST_DIR=/tmp/batocera-x86-32bit-libs-$CURRENTDATE

mkdir -p $DEST_DIR/lib
mkdir -p $DEST_DIR/usr/bin32
mkdir -p $DEST_DIR/usr/share/vulkan/icd.d
cp -a ${TARGET_DIR}/usr/bin/lindbergh                    $DEST_DIR/usr/bin32
cp -a ${TARGET_DIR}/usr/bin/gst-*                        $DEST_DIR/usr/bin32
cp -a ${TARGET_DIR}/usr/share/gst-plugins-base           $DEST_DIR/usr/share
cp -a ${TARGET_DIR}/usr/share/gstreamer-*                $DEST_DIR/usr/share
cp -a ${TARGET_DIR}/usr/wine                             $DEST_DIR/usr
cp -a ${TARGET_DIR}/usr/lib                              $DEST_DIR/usr/lib32
cp -a ${TARGET_DIR}/lib/*                                $DEST_DIR/usr/lib32
ln -sf libblkid.so.1                                     $DEST_DIR/usr/lib32/libblkid.so
ln -sf libudev.so.1                                      $DEST_DIR/usr/lib32/libudev.so
ln -sf libuuid.so.1                                      $DEST_DIR/usr/lib32/libuuid.so
ln -sf /usr/lib32/pulseaudio/libpulsecommon-17.0.so      $DEST_DIR/usr/lib32/libpulsecommon-17.0.so
ln -sf /usr/lib32                                        $DEST_DIR/lib32
ln -sf /usr/lib32/ld-linux.so.2                          $DEST_DIR/lib/ld-linux.so.2

cp -a ${TARGET_DIR}/usr/share/vulkan/icd.d/intel_hasvk_icd.*.json   $DEST_DIR/usr/share/vulkan/icd.d/intel_hasvk_icd.i686.json
cp -a ${TARGET_DIR}/usr/share/vulkan/icd.d/intel_icd.*.json         $DEST_DIR/usr/share/vulkan/icd.d/intel_icd.i686.json
cp -a ${TARGET_DIR}/usr/share/vulkan/icd.d/radeon_icd.*.json        $DEST_DIR/usr/share/vulkan/icd.d/radeon_icd.i686.json
sed -i s@/usr/lib/@/lib32/@g                                        $DEST_DIR/usr/share/vulkan/icd.d/*i686.json

rm -rf $DEST_DIR/usr/lib32/{avahi,gconv,glslang,graphene-1.0,icu,libfm,locale,bluez,gio}
rm -rf $DEST_DIR/usr/lib32/{pcmanfm,python3.*,terminfo,udev,xorg,X11}
rm -rf $DEST_DIR/usr/lib32/firmware
rm -rf $DEST_DIR/usr/wine/wine-custom/bin
rm -rf $DEST_DIR/usr/wine/wine-custom/include
rm -rf $DEST_DIR/usr/wine/wine-custom/share
rm -rf $DEST_DIR/usr/wine/wine-proton/bin
rm -rf $DEST_DIR/usr/wine/wine-proton/include
rm -rf $DEST_DIR/usr/wine/wine-proton/share
rm -rf $DEST_DIR/usr/lib32/*/include

find $DEST_DIR/ -type f -name "*.a" -exec rm {} \;

cd $DEST_DIR && tar -cf $DEST_DIR.tar .
xz -T0 -7 -v $DEST_DIR.tar
rm -r $DEST_DIR
cp -av $DEST_DIR.tar.xz /mnt/smb
mv $DEST_DIR.tar.xz  $HOME/dl/wine-x86
