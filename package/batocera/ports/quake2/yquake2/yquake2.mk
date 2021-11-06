################################################################################
#
# Yamagi Quake II
#
################################################################################
# Version.: Commits on Nov 06, 2021
YQUAKE2_VERSION = 42d61449b11bd0993d0f9d6636854276ef04b43e
YQUAKE2_SITE = $(call github,yquake2,yquake2,$(YQUAKE2_VERSION))

YQUAKE2_DEPENDENCIES = sdl2 sdl2_mixer
YQUAKE2_LICENSE = GPL-2.0

YQUAKE2_SUPPORTS_IN_SOURCE_BUILD = NO
YQUAKE2_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define YQUAKE2_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/buildroot-build/release/* $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/yquake2
	mv $(TARGET_DIR)/usr/bin/baseq2 $(TARGET_DIR)/usr/share/batocera/datainit/roms/yquake2
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/.yq2/{baseq2,rogue,xatrix}
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake2/yquake2/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.yq2/baseq2
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake2/yquake2/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.yq2/rogue
	cp -av $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake2/yquake2/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/.yq2/xatrix	
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake2/yquake2/yquake2.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
