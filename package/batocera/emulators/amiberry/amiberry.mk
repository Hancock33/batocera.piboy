################################################################################
#
# amiberry
#
################################################################################
# Version: Commits on May 26, 2024
AMIBERRY_VERSION = 2a8cc2017cbcf60e3079d518c65681c1866fa1ce
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
