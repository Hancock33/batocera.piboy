################################################################################
#
# Doom 3
#
################################################################################
# Version: Commits on May 28, 2022
DOOM3_VERSION = 6dfada9af0fc88e2f96ae8e89ce451ab382eea18
DOOM3_SITE = $(call github,dhewm,dhewm3,$(DOOM3_VERSION))

DOOM3_DEPENDENCIES = sdl2 sdl2_mixer
DOOM3_LICENSE = GPL-2.0

DOOM3_SUPPORTS_IN_SOURCE_BUILD = NO
DOOM3_SUBDIR = neo

DOOM3_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
DOOM3_CONF_OPTS += -DSDL2=ON

define DOOM3_KEYS
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/doom/doom3/doom3.keys $(TARGET_DIR)/usr/share/evmapy
endef

DOOM3_PRE_INSTALL_TARGET_HOOKS += DOOM3_KEYS

$(eval $(cmake-package))
