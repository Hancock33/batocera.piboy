################################################################################
#
# yquake2-zaero
#
################################################################################
# Version: Commits on Jan 04, 2025
YQUAKE2_ZAERO_VERSION = 093aaefdfd2b7396fd518e3be6ff197552a3d072
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
