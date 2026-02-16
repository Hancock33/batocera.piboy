################################################################################
#
# rott
#
################################################################################
# Version: Commits on Feb 16, 2026
ROTT_VERSION = 8ac55a77f842f2bb1953883cba94335dd021a758
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
