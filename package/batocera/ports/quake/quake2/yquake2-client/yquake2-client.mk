################################################################################
#
# yquake2-client
#
################################################################################
# Version: Commits on Dec 22, 2024
YQUAKE2_CLIENT_VERSION = 49b4e97f5d62f6597fbcba7cfcd4db66031c232a
YQUAKE2_CLIENT_SITE = $(call github,yquake2,yquake2,$(YQUAKE2_CLIENT_VERSION))

YQUAKE2_CLIENT_DEPENDENCIES = sdl2 sdl2_mixer
YQUAKE2_CLIENT_LICENSE = GPL-2.0
YQUAKE2_CLIENT_SUPPORTS_IN_SOURCE_BUILD = NO

define YQUAKE2_CLIENT_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/release/{q2ded,quake2,ref_gl1.so,ref_gl3.so,ref_soft.so} $(TARGET_DIR)/usr/bin

	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/baseq2
	cp -pvr $(@D)/buildroot-build/release/baseq2/* $(TARGET_DIR)/usr/share/game_assets/quake2/baseq2

	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/quake2/baseq2
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/quake2/yquake2-client/autoexec.cfg $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/quake2/baseq2
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/quake2/yquake2-client/yquake2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
