################################################################################
#
# xatrix
#
################################################################################
# Version: Commits on Sept 15, 2023
XATRIX_VERSION = 8123986f86f346e8aaef08859a2606f8446d47ee
XATRIX_SITE = $(call github,yquake2,xatrix,$(XATRIX_VERSION))

XATRIX_DEPENDENCIES = sdl2 sdl2_mixer yquake2
XATRIX_LICENSE = GPL-2.0
XATRIX_SUPPORTS_IN_SOURCE_BUILD = NO

define XATRIX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/xatrix
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/xatrix
endef

$(eval $(cmake-package))
