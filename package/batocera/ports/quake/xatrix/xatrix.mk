################################################################################
#
# xatrix
#
################################################################################
# Version: Commits on May 08, 2023
XATRIX_VERSION = 1010b2c694611c188b8c8a20b49d03036d9c8943
XATRIX_SITE = $(call github,yquake2,xatrix,$(XATRIX_VERSION))

XATRIX_DEPENDENCIES = sdl2 sdl2_mixer yquake2 host-ninja
XATRIX_LICENSE = GPL-2.0

XATRIX_SUPPORTS_IN_SOURCE_BUILD = NO
XATRIX_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja

define XATRIX_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(XATRIX_BUILDDIR)
endef

define XATRIX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/xatrix
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/xatrix
endef

$(eval $(cmake-package))
