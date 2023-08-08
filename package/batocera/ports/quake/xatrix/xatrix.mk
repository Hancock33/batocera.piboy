################################################################################
#
# xatrix
#
################################################################################
# Version: Commits on Jul 16, 2023
XATRIX_VERSION = 751f3f56fa68dfb6a7b248149c7647280d14eeca
XATRIX_SITE = $(call github,yquake2,xatrix,$(XATRIX_VERSION))

XATRIX_DEPENDENCIES = sdl2 sdl2_mixer yquake2
XATRIX_LICENSE = GPL-2.0
XATRIX_SUPPORTS_IN_SOURCE_BUILD = NO
XATRIX_CMAKE_BACKEND = ninja

XATRIX_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define XATRIX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/xatrix
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/xatrix
endef

$(eval $(cmake-package))
