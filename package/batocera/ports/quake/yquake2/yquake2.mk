################################################################################
#
# yquake2
#
################################################################################
# Version: Commits on Aug 13, 2023
YQUAKE2_VERSION = 9316bd0ba2dd02a67477ad8742595776c5a6127e
YQUAKE2_SITE = $(call github,yquake2,yquake2,$(YQUAKE2_VERSION))

YQUAKE2_DEPENDENCIES = sdl2 sdl2_mixer
YQUAKE2_LICENSE = GPL-2.0
YQUAKE2_SUPPORTS_IN_SOURCE_BUILD = NO

define YQUAKE2_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/release/{q2ded,quake2,ref_gl1.so,ref_gl3.so,ref_soft.so} $(TARGET_DIR)/usr/bin

    mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake2/baseq2
	cp -pvr $(@D)/buildroot-build/release/baseq2/* $(TARGET_DIR)/usr/share/game_assets/quake2/baseq2

	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/quake2/baseq2
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/yquake2/autoexec.cfg $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/quake2/baseq2
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/yquake2/yquake2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
