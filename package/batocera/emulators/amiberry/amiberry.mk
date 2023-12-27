################################################################################
#
# amiberry
#
################################################################################
# Version: Commits on Dec 27, 2023 (branch@preview)
AMIBERRY_VERSION = e8c1e40657b84c6c49e7d19966e52717d651e618
AMIBERRY_SITE = $(call github,BlitterStudio,amiberry,$(AMIBERRY_VERSION))
AMIBERRY_LICENSE = GPLv3
AMIBERRY_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf mpg123 libxml2 libmpeg2 flac libpng libserialport portmidi

define AMIBERRY_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/amiberry 						$(TARGET_DIR)/usr/bin/amiberry
	mkdir -p											$(TARGET_DIR)/usr/share/amiberry
	cp -rf $(@D)/data									$(TARGET_DIR)/usr/share/amiberry
	ln -sf /userdata/system/configs/amiberry/whdboot	$(TARGET_DIR)/usr/share/amiberry/whdboot
	ln -sf /usr/lib/libcapsimage.so.5.1 				$(TARGET_DIR)/usr/share/amiberry/capsimg.so

	mkdir -p 											$(TARGET_DIR)/usr/share/batocera/datainit/system/configs/amiberry
	cp -pvr $(@D)/whdboot 								$(TARGET_DIR)/usr/share/batocera/datainit/system/configs/amiberry
endef

define AMIBERRY_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/amiberry/controllers/*.amiberry.keys $(TARGET_DIR)/usr/share/evmapy
endef

AMIBERRY_POST_INSTALL_TARGET_HOOKS = AMIBERRY_EVMAP

$(eval $(cmake-package))
