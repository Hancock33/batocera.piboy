################################################################################
#
# vkquake
#
################################################################################
# Version: Commits on Oct 15, 2022
VKQUAKE_VERSION = 023d6e5566dfebec5da4cc83df4f438827a00553
VKQUAKE_SITE = $(call github,Novum,vkQuake,$(VKQUAKE_VERSION))

VKQUAKE_DEPENDENCIES = sdl2 sdl2_image
VKQUAKE_LICENSE = GPLv2

define VKQUAKE_REMOVE_WERROR
	$(SED) 's% -Werror%%' $(@D)/Quake/Makefile
endef

VKQUAKE_POST_PATCH_HOOKS += VKQUAKE_REMOVE_WERROR

define VKQUAKE_BUILD_CMDS
		$(TARGET_CONFIGURE_OPTS) $(MAKE) \
		CPP="$(TARGET_CPP)" CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		AS="$(TARGET_CC)" LD="$(TARGET_LD)" STRIP="$(TARGET_STRIP)" \
		-C $(@D)/Quake -f Makefile USE_SDL2=1 DO_USERDIRS=1
endef

define VKQUAKE_INSTALL_TARGET_CMDS
	cp -pvr $(@D)/Quake/vkquake $(TARGET_DIR)/usr/bin
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

$(eval $(generic-package))
