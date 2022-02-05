################################################################################
#
# Yamagi Quake II - The Reckoning
#
################################################################################
# Version.: Commits on Feb 05, 2022
XATRIX_VERSION = 4c654363424038cb068874df11572d0c945b7298
XATRIX_SITE = $(call github,yquake2,xatrix,$(XATRIX_VERSION))

XATRIX_DEPENDENCIES = sdl2 sdl2_mixer yquake2
XATRIX_LICENSE = GPL-2.0

XATRIX_SUPPORTS_IN_SOURCE_BUILD = NO
XATRIX_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define XATRIX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/yquake2/xatrix
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/batocera/datainit/roms/yquake2/xatrix
endef

$(eval $(cmake-package))
