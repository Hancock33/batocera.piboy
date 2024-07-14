################################################################################
#
# xatrix
#
################################################################################
# Version: Commits on Jul 13, 2024
XATRIX_VERSION = 0da23271851441de776a320446ca76e0183f8bf8
XATRIX_SITE = $(call github,yquake2,xatrix,$(XATRIX_VERSION))

XATRIX_DEPENDENCIES = sdl2 sdl2_mixer yquake2
XATRIX_LICENSE = GPL-2.0
XATRIX_SUPPORTS_IN_SOURCE_BUILD = NO

define XATRIX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/xatrix
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/xatrix
endef

$(eval $(cmake-package))
