################################################################################
#
# 32bit libraries
#
################################################################################
LIB32BIT_VERSION = 0.1
LIB32BIT_SOURCE = batocera-rpi4-32bit-libs.tar.gz
LIB32BIT_SITE = https://github.com/Hancock33/batocera-rp4-32bit-libs/releases/download/33-20211226

define LIB32BIT_EXTRACT_CMDS
	mkdir -p $(@D)/target && cd $(@D)/target && tar xf $(DL_DIR)/$(LIB32BIT_DL_SUBDIR)/$(LIB32BIT_SOURCE)
endef

define LIB32BIT_INSTALL_TARGET_CMDS
	cp -a $(@D)/target/lib32 $(TARGET_DIR)/usr
	ln -sf /usr/lib32/ld-linux-armhf.so.3 $(TARGET_DIR)/lib
endef

$(eval $(generic-package))
