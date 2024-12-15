################################################################################
#
# yquake2-ctf
#
################################################################################
# Version: Commits on Aug 12, 2024
YQUAKE2_CTF_VERSION = 6a2d5125f6ef4f2bdaa45e5d0979d47409535d84
YQUAKE2_CTF_SITE = $(call github,yquake2,ctf,$(YQUAKE2_CTF_VERSION))
YQUAKE2_CTF_DEPENDENCIES = sdl2
YQUAKE2_CTF_SUPPORTS_IN_SOURCE_BUILD = NO

define YQUAKE2_CTF_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/ctf
	cp -pvr $(@D)/buildroot-build/Release/* $(TARGET_DIR)/usr/share/game_assets/quake2/ctf
endef

$(eval $(cmake-package))
