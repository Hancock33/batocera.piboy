################################################################################
#
# yquake2-zaero
#
################################################################################
# Version: Commits on Dec 21, 2024
YQUAKE2_ZAERO_VERSION = c3322bec3fb9760fcdc615615a8dcab6d59b6bed
YQUAKE2_ZAERO_SITE = https://github.com/yquake2/zaero.git
YQUAKE2_ZAERO_SITE_METHOD = git
YQUAKE2_ZAERO_DEPENDENCIES = sdl2
YQUAKE2_ZAERO_SUPPORTS_IN_SOURCE_BUILD = NO

# Install game library
define YQUAKE2_ZAERO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/zaero
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/zaero
endef

$(eval $(cmake-package))
