################################################################################
#
# spacecadetpinball
#
################################################################################
# Version: Commits on Mar 26, 2023
SPACECADETPINBALL_VERSION = e466bbacb8a8d490f2e3d1632a9ee4ba46b6daaf
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
