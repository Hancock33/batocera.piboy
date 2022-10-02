################################################################################
#
# lib32bit-packager
#
################################################################################
DEST_DIR=/tmp/batocera-rpi4-32bit-libs-$(shell date +"%Y%m%d")

define LIB32BIT_PACKAGER_INSTALL_TARGET_CMDS
	mkdir -p $(DEST_DIR)
	mkdir -p $(DEST_DIR)/bin32
	mkdir -p $(DEST_DIR)/share

    cp -a $(TARGET_DIR)/usr/bin/{gmloader,sorr,box86}      $(DEST_DIR)/bin32
	cp -a $(TARGET_DIR)/usr/share/box86                    $(DEST_DIR)/share
	cp -a $(TARGET_DIR)/usr/lib                            $(DEST_DIR)/lib32
	cp -a $(TARGET_DIR)/lib/*                              $(DEST_DIR)/lib32
	ln -sf libblkid.so.1                                   $(DEST_DIR)/lib32/libblkid.so
	ln -sf libmount.so.1                                   $(DEST_DIR)/lib32/libmount.so
	ln -sf libsmartcols.so.1                               $(DEST_DIR)/lib32/libsmartcols.so
	ln -sf libudev.so.1                                    $(DEST_DIR)/lib32/libudev.so
	ln -sf libpulse.so.0.24.2                              $(DEST_DIR)/lib32/libpulse.so.0
	ln -sf libpulse-simple.so.0.1.1                        $(DEST_DIR)/lib32/libpulse-simple.so.0
	ln -sf libuuid.so.1                                    $(DEST_DIR)/lib32/libuuid.so
	rm -rf $(DEST_DIR)/lib32/{gconv,glslang,python3.10,terminfo,udev,xorg}
	mv $(DEST_DIR)/lib32/dri                               $(DEST_DIR)/lib32/dri.old
	mkdir -p $(DEST_DIR)/lib32/dri
	mv $(DEST_DIR)/lib32/dri.old/{v3d_dri.so,vc4_dri.so}   $(DEST_DIR)/lib32/dri
	rm -r $(DEST_DIR)/lib32/dri.old
	cd $(DEST_DIR) && tar -Jcvf $(DEST_DIR).tar.xz .
	rm -r $(DEST_DIR)
endef

$(eval $(virtual-package))
