################################################################################
#
# Yamagi Quake II - Ground Zero Addon
#
################################################################################
# Version: Commits on Apr 13, 2022
YROGUE_VERSION = 72a6f98730253a04349e7a04e7778d120edab1b0
YROGUE_SITE = $(call github,yquake2,rogue,$(YROGUE_VERSION))

YROGUE_DEPENDENCIES = sdl2 sdl2_mixer yquake2
YROGUE_LICENSE = GPL-2.0

YROGUE_SUPPORTS_IN_SOURCE_BUILD = NO
YROGUE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define YROGUE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/yquake2/rogue
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/batocera/datainit/roms/yquake2/rogue
endef

$(eval $(cmake-package))
