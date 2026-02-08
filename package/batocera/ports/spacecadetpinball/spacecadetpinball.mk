################################################################################
#
# spacecadetpinball
#
################################################################################
# Version: Commits on Aug 21, 2024
SPACECADETPINBALL_VERSION = cb9b7b886244a27773f66b0b19fdc2998392565e
SPACECADETPINBALL_SITE = $(call github,k4zmu2a,SpaceCadetPinball,$(SPACECADETPINBALL_VERSION))
SPACECADETPINBALL_EMULATOR_INFO = spacecadetpinball.emulator.yml
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
$(eval $(emulator-info-package))
