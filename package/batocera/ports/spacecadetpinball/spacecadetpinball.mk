################################################################################
#
# Space Cadet Pinball
#
################################################################################
# Version.: Commits on Jan 26, 2022
SPACECADETPINBALL_VERSION = 29c84c37c8e8469588e8e3c26ac3808eccdf4eb7
SPACECADETPINBALL_SITE = $(call github,k4zmu2a,SpaceCadetPinball,$(SPACECADETPINBALL_VERSION))

SPACECADETPINBALL_DEPENDENCIES = sdl2 sdl2_mixer
SPACECADETPINBALL_LICENSE = MIT

SPACECADETPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

SPACECADETPINBALL_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define SPACECADETPINBALL_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/spacecadetpinball
	$(INSTALL) -D $(@D)/bin/SpaceCadetPinball $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/spacecadetpinball/spacecadetpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
