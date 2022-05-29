################################################################################
#
# Yamagi Quake II - Ground Zero Addon
#
################################################################################
# Version: Commits on May 28, 2022
YROGUE_VERSION = 15ffab8518c907d00748f0401be364db7132fc8e
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
