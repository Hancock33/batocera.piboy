################################################################################
#
# spacecadetpinball
#
################################################################################
# Version: Commits on Jan 27, 2024
SPACECADETPINBALL_VERSION = 73262ae2076db19b7d5da8e710abc457c11de128
SPACECADETPINBALL_SITE = $(call github,k4zmu2a,SpaceCadetPinball,$(SPACECADETPINBALL_VERSION))

SPACECADETPINBALL_DEPENDENCIES = sdl2 sdl2_mixer
SPACECADETPINBALL_LICENSE = MIT
SPACECADETPINBALL_SUPPORTS_IN_SOURCE_BUILD = NO

define SPACECADETPINBALL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/spacecadetpinball
	$(INSTALL) -D $(@D)/bin/SpaceCadetPinball $(TARGET_DIR)/usr/bin
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/spacecadetpinball/spacecadetpinball.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
