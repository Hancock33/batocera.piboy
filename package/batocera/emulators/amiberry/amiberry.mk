################################################################################
#
# amiberry
#
################################################################################
# Version: Commits on May 07, 2025
AMIBERRY_VERSION = 1e31ad1b679b1047c51117224cd6a9bba16b9e44
AMIBERRY_SITE = $(call github,BlitterStudio,amiberry,$(AMIBERRY_VERSION))
AMIBERRY_LICENSE = GPLv3
AMIBERRY_DEPENDENCIES += sdl2 sdl2_image sdl2_ttf mpg123 libxml2 libmpeg2 flac
AMIBERRY_DEPENDENCIES += libpng libserialport portmidi zlib
AMIBERRY_SUPPORTS_IN_SOURCE_BUILD = NO

ifeq ($(BR2_PACKAGE_LIBGLEW),y)
    AMIBERRY_DEPENDENCIES += libglew
endif

AMIBERRY_CONF_OPTS += -DWITH_LTO=ON

define AMIBERRY_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/amiberry/*.amiberry.keys $(TARGET_DIR)/usr/share/evmapy
endef

AMIBERRY_POST_INSTALL_TARGET_HOOKS = AMIBERRY_EVMAP

$(eval $(cmake-package))
