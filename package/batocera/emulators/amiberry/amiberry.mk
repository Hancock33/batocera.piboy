################################################################################
#
# amiberry
#
################################################################################
# Version: Commits on Oct 27, 2024
AMIBERRY_VERSION = 9dc7dec4f460749f12666422b4e5a43c238b7c4b
AMIBERRY_SITE = $(call github,BlitterStudio,amiberry,$(AMIBERRY_VERSION))
AMIBERRY_LICENSE = GPLv3
AMIBERRY_DEPENDENCIES = sdl2 sdl2_image sdl2_ttf mpg123 libxml2 libmpeg2 flac libpng libserialport portmidi
AMIBERRY_SUPPORTS_IN_SOURCE_BUILD = NO

define AMIBERRY_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/amiberry/controllers/*.amiberry.keys $(TARGET_DIR)/usr/share/evmapy
endef

AMIBERRY_POST_INSTALL_TARGET_HOOKS = AMIBERRY_EVMAP

$(eval $(cmake-package))
