################################################################################
#
# Yamagi Quake II - The Reckoning
#
################################################################################
# Version: Commits on May 20, 2022
XATRIX_VERSION = 39e4828a65def17cf710b45c59a794b11d508e50
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
