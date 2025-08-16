################################################################################
#
# amiberry-lite
#
################################################################################
# Version: Commits on Aug 16, 2025
AMIBERRY_LITE_VERSION = 24be432b8a1aa3c1a618d4e779f74b262e952c0b
AMIBERRY_LITE_SITE = $(call github,BlitterStudio,amiberry-lite,$(AMIBERRY_LITE_VERSION))
AMIBERRY_LITE_LICENSE = GPLv3
AMIBERRY_LITE_DEPENDENCIES += flac libpcap libmpeg2 libpng libserialport libxml2 mpg123
AMIBERRY_LITE_DEPENDENCIES += portmidi sdl2 sdl2_image sdl2_ttf zlib
AMIBERRY_LITE_SUPPORTS_IN_SOURCE_BUILD = NO

AMIBERRY_LITE_CONF_OPTS += -DWITH_LTO=ON

define AMIBERRY_LITE_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/amiberry-lite/controllers/*.amiberry.keys $(TARGET_DIR)/usr/share/evmapy
endef

AMIBERRY_LITE_POST_INSTALL_TARGET_HOOKS = AMIBERRY_LITE_EVMAP

$(eval $(cmake-package))
