################################################################################
#
# yquake2-zaero
#
################################################################################
# Version: Commits on Sept 21, 2024
YQUAKE2_ZAERO_VERSION = 137ed0f0bd4f571b30da868d4fc448c0220d9b93
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
