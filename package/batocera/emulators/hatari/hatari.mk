################################################################################
#
# hatari
#
################################################################################
# Version: Commits on Dec 04, 2022
HATARI_VERSION = 3a133cc2d21a3bb3a697f60409451835259e672c
HATARI_SITE = $(call github,hatari,hatari,$(HATARI_VERSION))
HATARI_LICENSE = GPLv3
HATARI_DEPENDENCIES = sdl2 zlib libpng libcapsimage

HATARI_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
HATARI_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
HATARI_CONF_OPTS += -DCAPSIMAGE_INCLUDE_DIR="($STAGING_DIR)/usr/include/caps"

define HATARI_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/hatari $(TARGET_DIR)/usr/bin/hatari
        mkdir -p $(TARGET_DIR)/usr/share/hatari

    # evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/hatari/*.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
