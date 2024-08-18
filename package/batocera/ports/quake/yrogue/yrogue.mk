################################################################################
#
# yrogue
#
################################################################################
# Version: Commits on Aug 12, 2024
YROGUE_VERSION = f9dd3be7e784a01ede4ccd4c3736870abf6aba6c
YROGUE_SITE = $(call github,yquake2,rogue,$(YROGUE_VERSION))

YROGUE_DEPENDENCIES = sdl2 sdl2_mixer yquake2
YROGUE_LICENSE = GPL-2.0
YROGUE_SUPPORTS_IN_SOURCE_BUILD = NO

define YROGUE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/rogue
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/rogue
endef

$(eval $(cmake-package))
