################################################################################
#
# rott
#
################################################################################
# Version: Commits on Oct 31, 2025
ROTT_VERSION = e81fd4da44164e04cd72abef0f8bdf85f4074d17
ROTT_SITE = $(call github,fabiangreffrath,taradino,$(ROTT_VERSION))
ROTT_LICENSE = GPLv2
ROTT_LICENSE_FILE = README.md

ROTT_DEPENDENCIES = sdl2 sdl2_mixer

ROTT_SUPPORTS_IN_SOURCE_BUILD = NO

ROTT_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF

define ROTT_INSTALL_TARGET_CMDS
	cp $(@D)/buildroot-build/taradino $(TARGET_DIR)/usr/bin/rott-darkwar
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/rott/rott.keys $(TARGET_DIR)/usr/share/evmapy
endef

define ROTT_FIX_SDL2MAIN
	sed -i -e s+"SDL2_mixer::SDL2_mixer"+"-lSDL2_mixer"+ $(@D)/CMakeLists.txt
endef
ROTT_PRE_CONFIGURE_HOOKS += ROTT_FIX_SDL2MAIN

$(eval $(cmake-package))
