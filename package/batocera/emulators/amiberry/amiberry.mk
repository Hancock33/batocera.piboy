################################################################################
#
# amiberry
#
################################################################################
# Version: Commits on Dec 05, 2025
AMIBERRY_VERSION = 0215279dc19a087f36c1d22e9b6dd171945d40e0
AMIBERRY_SITE = $(call github,BlitterStudio,amiberry,$(AMIBERRY_VERSION))
AMIBERRY_LICENSE = GPLv3
AMIBERRY_DEPENDENCIES += flac libpcap libmpeg2 libpng libserialport libxml2 mpg123
AMIBERRY_DEPENDENCIES += portmidi sdl2 sdl2_image sdl2_ttf zlib
AMIBERRY_SUPPORTS_IN_SOURCE_BUILD = NO

ifeq ($(BR2_PACKAGE_LIBGLEW)$(BR2_PACKAGE_LIBGLU),yy)
    AMIBERRY_DEPENDENCIES += libglew libglu
    AMIBERRY_CONF_OPTS += -DUSE_OPENGL=ON
else
    AMIBERRY_CONF_OPTS += -DUSE_OPENGL=OFF
endif

AMIBERRY_CONF_OPTS += -DWITH_LTO=ON

define AMIBERRY_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/amiberry/controllers/*.amiberry.keys $(TARGET_DIR)/usr/share/evmapy
endef

AMIBERRY_POST_INSTALL_TARGET_HOOKS = AMIBERRY_EVMAP

$(eval $(cmake-package))
