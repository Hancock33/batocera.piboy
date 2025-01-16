################################################################################
#
# amiberry
#
################################################################################
# Version: Commits on Jan 16, 2025
AMIBERRY_VERSION = e8ed4c8a6aa7f067e90111fdfba3a61a97704fa6
AMIBERRY_SITE = $(call github,BlitterStudio,amiberry,$(AMIBERRY_VERSION))
AMIBERRY_LICENSE = GPLv3
AMIBERRY_DEPENDENCIES += sdl2 sdl2_image sdl2_ttf mpg123 libxml2 libmpeg2 flac
AMIBERRY_DEPENDENCIES += libpng libserialport portmidi
AMIBERRY_SUPPORTS_IN_SOURCE_BUILD = NO

AMIBERRY_CONF_OPTS += -DWITH_LTO=ON

define AMIBERRY_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/amiberry/controllers/*.amiberry.keys $(TARGET_DIR)/usr/share/evmapy
endef

AMIBERRY_POST_INSTALL_TARGET_HOOKS = AMIBERRY_EVMAP

$(eval $(cmake-package))
