################################################################################
#
# Yamagi Quake II
#
################################################################################
# Version.: Commits on Dec 24, 2021
YQUAKE2_VERSION = d8c8bb0ba7937768d216a423d6204df1edce2674
YQUAKE2_SITE = $(call github,yquake2,yquake2,$(YQUAKE2_VERSION))

YQUAKE2_DEPENDENCIES = sdl2 sdl2_mixer
YQUAKE2_LICENSE = GPL-2.0

YQUAKE2_SUPPORTS_IN_SOURCE_BUILD = NO
YQUAKE2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define YQUAKE2_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/yquake2/baseq2
	cp -pvr $(@D)/buildroot-build/release/baseq2/* $(TARGET_DIR)/usr/share/batocera/datainit/roms/yquake2/baseq2
	cp -pvr $(@D)/buildroot-build/release/{q2ded,quake2,ref_gl1.so,ref_gl3.so,ref_soft.so} $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake2/yquake2/yquake2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
