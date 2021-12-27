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
	cp -a $(@D)/target/lib32 $(TARGET_DIR)/usr
	cp -a $(@D)/target/bin32 $(TARGET_DIR)/usr
	cp -a $(@D)/target/share $(TARGET_DIR)/usr
	ln -sf /usr/lib32/ld-linux-armhf.so.3 $(TARGET_DIR)/lib
endef

define LIB32BIT_INSTALL_TARGET_CMDS
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/32bit/lib32bit/sorr.keys $(TARGET_DIR)/usr/share/evmapy/sorr.keys
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/32bit/lib32bit/droidports.keys $(TARGET_DIR)/usr/share/evmapy/droidports.keys	
endef

$(eval $(generic-package))
