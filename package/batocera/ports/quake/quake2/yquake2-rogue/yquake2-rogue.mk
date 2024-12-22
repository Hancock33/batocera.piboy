################################################################################
#
# yquake2-rogue
#
################################################################################
# Version: Commits on Dec 21, 2024
YQUAKE2_ROGUE_VERSION = 830ad45774336194ae77351865f9d5b991be2979
YQUAKE2_ROGUE_SITE = $(call github,yquake2,rogue,$(YQUAKE2_ROGUE_VERSION))
YQUAKE2_ROGUE_DEPENDENCIES = sdl2
YQUAKE2_ROGUE_SUPPORTS_IN_SOURCE_BUILD = NO

# Install game library
define YQUAKE2_ROGUE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/rogue
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/rogue
endef

$(eval $(cmake-package))
