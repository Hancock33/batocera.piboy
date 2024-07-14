################################################################################
#
# vkquake
#
################################################################################
# Version: Commits on Jul 14, 2024
VKQUAKE_VERSION = debcaca0c94a1d927d0bedfeb9313db290304f13
VKQUAKE_SITE = $(call github,Novum,vkQuake,$(VKQUAKE_VERSION))

VKQUAKE_DEPENDENCIES = sdl2 sdl2_image
VKQUAKE_LICENSE = GPLv2

define VKQUAKE_WERROR
	sed -i 's/-Werror/-w/g' $(@D)/meson.build
endef

VKQUAKE_POST_EXTRACT_HOOKS += VKQUAKE_WERROR

define VKQUAKE_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/build/vkquake $(TARGET_DIR)/usr/bin
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/quake1/id1
	cp -pvr $(@D)/Quake/vkquake.pak $(TARGET_DIR)/usr/share/game_assets/quake1/id1
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/vkquake/{id1,dopa,hipnotic,rogue}
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/vkquake/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/vkquake/id1
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/vkquake/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/vkquake/dop
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/vkquake/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/vkquake/hipnotic
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/vkquake/config.cfg $(TARGET_DIR)/usr/share/batocera/datainit/system/configs/vkquake/rogue
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/quake/vkquake/vkquake.keys $(TARGET_DIR)/usr/share/evmapy/tyrquake.vkquake.keys
endef

$(eval $(meson-package))
