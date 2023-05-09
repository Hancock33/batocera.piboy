################################################################################
#
# yrogue
#
################################################################################
# Version: Commits on May 08, 2023
YROGUE_VERSION = 352e81481afab89ffc887d54c0dce95cc6ce9c38
YROGUE_SITE = $(call github,yquake2,rogue,$(YROGUE_VERSION))

YROGUE_DEPENDENCIES = sdl2 sdl2_mixer yquake2 host-ninja
YROGUE_LICENSE = GPL-2.0

YROGUE_SUPPORTS_IN_SOURCE_BUILD = NO
YROGUE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja

define YROGUE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(YROGUE_BUILDDIR)
endef

define YROGUE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/rogue
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/rogue
endef

$(eval $(cmake-package))
