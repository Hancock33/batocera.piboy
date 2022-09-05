################################################################################
#
# spacecadetpinball
#
################################################################################
# Version: Commits on Sept 05, 2022
SPACECADETPINBALL_VERSION = 44d5fd509729374865c361de190fafd00f4781ae
SPACECADETPINBALL_SITE = $(call github,k4zmu2a,SpaceCadetPinball,$(SPACECADETPINBALL_VERSION))

SPACECADETPINBALL_DEPENDENCIES = sdl2 sdl2_mixer
SPACECADETPINBALL_LICENSE = MIT

SPACECADETPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

SPACECADETPINBALL_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define SPACECADETPINBALL_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/spacecadetpinball
	$(INSTALL) -D $(@D)/bin/SpaceCadetPinball $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/spacecadetpinball/spacecadetpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
