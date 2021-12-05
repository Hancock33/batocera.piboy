################################################################################
#
# Space Cadet Pinball
#
################################################################################
# Version.: Commits on Dec 03, 2021
SPACECADETPINBALL_VERSION = 389122182e34f9b37d5476b797bb7b7b4d217f51
SPACECADETPINBALL_SITE = $(call github,k4zmu2a,SpaceCadetPinball,$(SPACECADETPINBALL_VERSION))

SPACECADETPINBALL_DEPENDENCIES = sdl2 sdl2_mixer
SPACECADETPINBALL_LICENSE = MIT

SPACECADETPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

SPACECADETPINBALL_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

ifeq ($(BR2_PACKAGE_XPI_GAMECON_RPI3)$(BR2_PACKAGE_XPI_GAMECON_RPI4),y)
   SPACECADETPINBALL_POST_INSTALL_TARGET_HOOKS +=SPACECADETPINBALL_INSTALL_BOOT_PIBOY
else
   SPACECADETPINBALL_POST_INSTALL_TARGET_HOOKS +=SPACECADETPINBALL_INSTALL_BOOT_X86
endif


define SPACECADETPINBALL_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/spacecadetpinball
	$(INSTALL) -D $(@D)/bin/SpaceCadetPinball $(TARGET_DIR)/usr/share/batocera/datainit/roms/spacecadetpinball
	echo "cd /userdata/roms/spacecadetpinball && /userdata/roms/spacecadetpinball/SpaceCadetPinball" > $(TARGET_DIR)/usr/bin/SpaceCadetPinball.sh
	chmod 0754 $(TARGET_DIR)/usr/bin/SpaceCadetPinball.sh
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/spacecadetpinball/spacecadetpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

define SPACECADETPINBALL_INSTALL_BOOT_PIBOY
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/spacecadetpinball/SpaceCadetPinball.rpi4 $(TARGET_DIR)/usr/bin/SpaceCadetPinball
	chmod 0754 $(TARGET_DIR)/usr/bin/SpaceCadetPinball
endef

define SPACECADETPINBALL_INSTALL_BOOT_X86
    cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/spacecadetpinball/SpaceCadetPinball.x86 $(TARGET_DIR)/usr/bin/SpaceCadetPinball
	chmod 0754 $(TARGET_DIR)/usr/bin/SpaceCadetPinball
endef

$(eval $(cmake-package))
