################################################################################
#
# yrogue
#
################################################################################
# Version: Commits on Jul 13, 2024
YROGUE_VERSION = bea9dc85ffcc148fe7a30d212b2b76e5ff028ed9
YROGUE_SITE = $(call github,yquake2,rogue,$(YROGUE_VERSION))

YROGUE_DEPENDENCIES = sdl2 sdl2_mixer yquake2
YROGUE_LICENSE = GPL-2.0
YROGUE_SUPPORTS_IN_SOURCE_BUILD = NO

define YROGUE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/rogue
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/rogue
endef

$(eval $(cmake-package))
