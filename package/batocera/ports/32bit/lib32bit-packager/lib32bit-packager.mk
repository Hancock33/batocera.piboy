################################################################################
#
# lib32bit-packager
#
################################################################################
DEST_DIR=/tmp/batocera-$(LIB32BIT_ARCH)-32bit-libs-$(shell date +"%Y%m%d")

ifeq ($(BR2_arm),y)
	LIB32BIT_ARCH = rpi4
	ARM_INSTALL=y
else
	LIB32BIT_ARCH = x86
	ARM_INSTALL=n
endif

define LIB32BIT_PACKAGER_INSTALL_TARGET_CMDS
	mkdir -p $(DEST_DIR)
	mkdir -p $(DEST_DIR)/bin32
	mkdir -p $(DEST_DIR)/share

    cp -a $(TARGET_DIR)/usr/bin/{sorr,box86}                 $(DEST_DIR)/bin32	
	cp -a $(TARGET_DIR)/usr/share/box86                      $(DEST_DIR)/share
	cp -a $(TARGET_DIR)/usr/lib                              $(DEST_DIR)/lib32
	cp -a $(TARGET_DIR)/lib/*                                $(DEST_DIR)/lib32
	ln -sf libblkid.so.1                                     $(DEST_DIR)/lib32/libblkid.so
	ln -sf libmount.so.1                                     $(DEST_DIR)/lib32/libmount.so
	ln -sf libsmartcols.so.1                                 $(DEST_DIR)/lib32/libsmartcols.so
	ln -sf libudev.so.1                                      $(DEST_DIR)/lib32/libudev.so
	ln -sf libuuid.so.1                                      $(DEST_DIR)/lib32/libuuid.so
	rm -rf $(DEST_DIR)/lib32/{gconv,glslang,python3.10,terminfo,udev,xorg}

	@if [ "$(ARM_INSTALL)" = "y" ]; then \
		cp -a $(TARGET_DIR)/usr/bin/gmloader                 $(DEST_DIR)/bin32 ; \
		mv $(DEST_DIR)/lib32/dri                             $(DEST_DIR)/lib32/dri.old ; \
		mkdir -p $(DEST_DIR)/lib32/dri ; \
		mv $(DEST_DIR)/lib32/dri.old/{v3d_dri.so,vc4_dri.so} $(DEST_DIR)/lib32/dri ; \
		rm -r $(DEST_DIR)/lib32/dri.old ; \
	fi

	cd $(DEST_DIR) && tar -Jcf $(DEST_DIR).tar.xz .
	rm -r $(DEST_DIR)
endef

$(eval $(virtual-package))
