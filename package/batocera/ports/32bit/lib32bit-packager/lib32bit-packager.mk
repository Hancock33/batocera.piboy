################################################################################
#
# lib32bit-packager
#
################################################################################
DEST_DIR=/tmp/batocera-$(LIB32BIT_ARCH)-32bit-libs-$(shell date +"%Y%m%d")

ifeq ($(BR2_arm),y)
LIB32BIT_ARCH = rpi4
LIB32BIT_PACKAGER_POST_INSTALL_TARGET_HOOKS = ARCHIVE_ARM
else
LIB32BIT_ARCH = x86
LIB32BIT_PACKAGER_POST_INSTALL_TARGET_HOOKS = ARCHIVE_X86
endif

define ARCHIVE_ARM
	mkdir -p $(DEST_DIR)
	mkdir -p $(DEST_DIR)/bin32
	mkdir -p $(DEST_DIR)/share
	cp -a $(TARGET_DIR)/usr/bin/{sorr,box86,gmloader}        $(DEST_DIR)/bin32
	cp -a $(TARGET_DIR)/usr/share/box86                      $(DEST_DIR)/share
	cp -a $(TARGET_DIR)/usr/lib                              $(DEST_DIR)/lib32
	cp -a $(TARGET_DIR)/lib/*                                $(DEST_DIR)/lib32
	ln -sf libblkid.so.1                                     $(DEST_DIR)/lib32/libblkid.so
	ln -sf libmount.so.1                                     $(DEST_DIR)/lib32/libmount.so
	ln -sf libsmartcols.so.1                                 $(DEST_DIR)/lib32/libsmartcols.so
	ln -sf libudev.so.1                                      $(DEST_DIR)/lib32/libudev.so
	ln -sf libuuid.so.1                                      $(DEST_DIR)/lib32/libuuid.so
	rm -rf $(DEST_DIR)/lib32/{gconv,glslang,python3.*,terminfo,udev,xorg}
	mv $(DEST_DIR)/lib32/dri                                 $(DEST_DIR)/lib32/dri.old
	mkdir -p $(DEST_DIR)/lib32/dri
	mv $(DEST_DIR)/lib32/dri.old/{v3d_dri.so,vc4_dri.so}     $(DEST_DIR)/lib32/dri
	rm -r $(DEST_DIR)/lib32/dri.old
	cd $(DEST_DIR) && tar -Jcf $(DEST_DIR).tar.xz .
	rm -r $(DEST_DIR)
endef

define ARCHIVE_X86
	mkdir -p $(DEST_DIR)/lib
	mkdir -p $(DEST_DIR)/usr/bin32
	mkdir -p $(DEST_DIR)/usr/share
	cp -a $(TARGET_DIR)/usr/bin/gst-*                        $(DEST_DIR)/usr/bin32
	cp -a $(TARGET_DIR)/usr/bin/{sorr,box86}                 $(DEST_DIR)/usr/bin32
	cp -a $(TARGET_DIR)/usr/share/box86                      $(DEST_DIR)/usr/share
	cp -a $(TARGET_DIR)/usr/share/vulkan                     $(DEST_DIR)/usr/share
	cp -a $(TARGET_DIR)/usr/share/gst-plugins-base           $(DEST_DIR)/usr/share
	cp -a $(TARGET_DIR)/usr/share/gstreamer-*                $(DEST_DIR)/usr/share
	cp -a $(TARGET_DIR)/usr/wine                             $(DEST_DIR)/usr
	cp -a $(TARGET_DIR)/usr/lib                              $(DEST_DIR)/usr/lib32
	cp -a $(TARGET_DIR)/lib/*                                $(DEST_DIR)/usr/lib32
	ln -sf libblkid.so.1                                     $(DEST_DIR)/usr/lib32/libblkid.so
	ln -sf libmount.so.1                                     $(DEST_DIR)/usr/lib32/libmount.so
	ln -sf libsmartcols.so.1                                 $(DEST_DIR)/usr/lib32/libsmartcols.so
	ln -sf libudev.so.1                                      $(DEST_DIR)/usr/lib32/libudev.so
	ln -sf libuuid.so.1                                      $(DEST_DIR)/usr/lib32/libuuid.so
	ln -sf /usr/lib32                                        $(DEST_DIR)/lib32
	ln -sf /usr/lib32/ld-linux.so.2                          $(DEST_DIR)/lib/ld-linux.so.2

	rm -rf $(DEST_DIR)/usr/lib32/{avahi,gconv,glslang,graphene-1.0,icu,libfm,locale}
	rm -rf $(DEST_DIR)/usr/lib32/{pcmanfm,python3.*,terminfo,udev,xorg,X11}
	cd $(DEST_DIR) && tar -Jcf $(DEST_DIR).tar.xz .
	rm -r $(DEST_DIR)
endef

$(eval $(virtual-package))
