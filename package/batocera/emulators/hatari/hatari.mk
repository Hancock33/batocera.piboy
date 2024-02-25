################################################################################
#
# hatari
#
################################################################################
# Version: Commits on Feb 24, 2024
HATARI_VERSION = 8e8a911e992a6cb91692f93506c933ca655f9fd7
HATARI_SITE = $(call github,hatari,hatari,$(HATARI_VERSION))
HATARI_LICENSE = GPLv3
HATARI_DEPENDENCIES = sdl2 zlib libpng libcapsimage

HATARI_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
HATARI_CONF_OPTS += -DCAPSIMAGE_INCLUDE_DIR="($STAGING_DIR)/usr/include/caps"
HATARI_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
HATARI_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define HATARI_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/hatari $(TARGET_DIR)/usr/bin/hatari
		mkdir -p $(TARGET_DIR)/usr/share/hatari

	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/hatari/*.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
