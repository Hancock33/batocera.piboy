################################################################################
#
# lib32bit
#
################################################################################
# Version: Commits on Jan 04, 2026
LIB32BIT_VERSION = 20260104
LIB32BIT_SOURCE = batocera-rpi4-32bit-libs-$(LIB32BIT_VERSION).tar.xz
LIB32BIT_SITE = https://github.com/Hancock33/batocera-32bit-libs/releases/download/$(LIB32BIT_VERSION)

define LIB32BIT_EXTRACT_CMDS
	mkdir -p $(TARGET_DIR)/{lib,usr}
	tar xf $(DL_DIR)/$(LIB32BIT_DL_SUBDIR)/$(LIB32BIT_SOURCE) -C $(TARGET_DIR)/usr
endef

define LIB32BIT_GLIBC_LIB
	ln -sf /usr/lib32/ld-linux-armhf.so.3 $(TARGET_DIR)/lib
endef

ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GLIBC),y)
LIB32BIT_POST_INSTALL_TARGET_HOOKS += LIB32BIT_GLIBC_LIB
endif

define LIB32BIT_INSTALL_TARGET_CMDS
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy/piboy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/32bit/lib32bit/sorr.keys       $(TARGET_DIR)/usr/share/evmapy/sorr.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/32bit/lib32bit/droidports.keys $(TARGET_DIR)/usr/share/evmapy/droidports.keys
endef

$(eval $(generic-package))
