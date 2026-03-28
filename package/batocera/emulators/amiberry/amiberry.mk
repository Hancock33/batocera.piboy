################################################################################
#
# amiberry
#
################################################################################
# Version: Commits on Mar 28, 2026
AMIBERRY_VERSION = 87ee5be6feb7fa5b2f56ddba3c1c0495829573ab
AMIBERRY_SITE = $(call github,BlitterStudio,amiberry,$(AMIBERRY_VERSION))
AMIBERRY_LICENSE = GPLv3
AMIBERRY_SUPPORTS_IN_SOURCE_BUILD = NO

AMIBERRY_DEPENDENCIES += flac libpcap libmpeg2 libpng libserialport libxml2 mpg123
AMIBERRY_DEPENDENCIES += portmidi sdl3 sdl3_image sdl3_ttf zlib
AMIBERRY_EMULATOR_INFO = amiberry.emulator.yml

AMIBERRY_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
AMIBERRY_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
AMIBERRY_CONF_OPTS += -DWITH_LTO=ON

ifeq ($(BR2_PACKAGE_LIBGLEW)$(BR2_PACKAGE_LIBGLU),yy)
AMIBERRY_DEPENDENCIES += libglew libglu
AMIBERRY_CONF_OPTS += -DUSE_OPENGL=ON
else
AMIBERRY_CONF_OPTS += -DUSE_OPENGL=OFF
endif

define AMIBERRY_EVMAP
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -pvr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/amiberry/controllers/*.amiberry.keys $(TARGET_DIR)/usr/share/evmapy
endef

AMIBERRY_POST_INSTALL_TARGET_HOOKS = AMIBERRY_EVMAP

$(eval $(cmake-package))
$(eval $(emulator-info-package))
