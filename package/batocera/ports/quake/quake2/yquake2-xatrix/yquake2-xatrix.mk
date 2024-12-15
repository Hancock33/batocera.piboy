################################################################################
#
# yquake2-xatrix
#
################################################################################
# Version: Commits on Sept 21, 2024
YQUAKE2_XATRIX_VERSION = 1957253b256180f9bbb5b52c8d63cc1578170211
YQUAKE2_XATRIX_SITE = $(call github,yquake2,xatrix,$(YQUAKE2_XATRIX_VERSION))
YQUAKE2_XATRIX_DEPENDENCIES = sdl2
YQUAKE2_XATRIX_SUPPORTS_IN_SOURCE_BUILD = NO

# Install game library
define YQUAKE2_XATRIX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/xatrix
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/xatrix
endef

$(eval $(cmake-package))
