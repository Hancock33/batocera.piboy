################################################################################
#
# openjk
#
################################################################################
# Version: Commits on Apr 22, 2023
OPENJK_VERSION = 4edea1a45303300897dd1197eabca9891a596922
OPENJK_SITE = $(call github,JACoders,OpenJK,$(OPENJK_VERSION))

OPENJK_DEPENDENCIES = sdl2 openal
OPENJK_LICENSE = GPL-2.0
OPENJK_SUPPORTS_IN_SOURCE_BUILD = NO

#Single player
OPENJK_CONF_OPTS += -DBuildSPEngine=ON
OPENJK_CONF_OPTS += -DBuildSPGame=ON
OPENJK_CONF_OPTS += -DBuildSPRdVanilla=ON
OPENJK_CONF_OPTS += -DBuildJK2SPEngine=ON
OPENJK_CONF_OPTS += -DBuildJK2SPGame=ON
OPENJK_CONF_OPTS += -DBuildJK2SPRdVanilla=ON
#Multi player
OPENJK_CONF_OPTS += -DBuildMPEngine=OFF
OPENJK_CONF_OPTS += -DBuildMPRdVanilla=OFF
OPENJK_CONF_OPTS += -DBuildMPDed=OFF
OPENJK_CONF_OPTS += -DBuildMPGame=OFF
OPENJK_CONF_OPTS += -DBuildMPCGame=OFF
OPENJK_CONF_OPTS += -DBuildMPUI=OFF

define OPENJK_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/game_assets/openjkja
    $(INSTALL) -D $(@D)/buildroot-build/openjk_sp.*                       $(TARGET_DIR)/usr/bin/openjk_sp
    $(INSTALL) -D $(@D)/buildroot-build/code/rd-vanilla/rdsp-vanilla_*.so $(TARGET_DIR)/usr/share/game_assets/openjkja
    $(INSTALL) -D $(@D)/buildroot-build/code/game/jagame*.so              $(TARGET_DIR)/usr/share/game_assets/openjkja
    mkdir -p $(TARGET_DIR)/usr/share/game_assets/openjkjo
    $(INSTALL) -D $(@D)/buildroot-build/openjo_sp.*                         $(TARGET_DIR)/usr/bin/openjo_sp
    $(INSTALL) -D $(@D)/buildroot-build/code/rd-vanilla/rdjosp-vanilla_*.so $(TARGET_DIR)/usr/share/game_assets/openjkjo
    $(INSTALL) -D $(@D)/buildroot-build/codeJK2/game/jospgame*.so           $(TARGET_DIR)/usr/share/game_assets/openjkjo
	# evmap config
	 mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openjk/openjkja.keys $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openjk/openjkjo.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
