################################################################################
#
# prototype
#
################################################################################
# Version: Commits on Jan 11, 2025
PROTOTYPE_VERSION = 80a045a3a3796c3d7506d2e6fdeada5ec3eedf73
PROTOTYPE_SITE = $(call github,ptitSeb,prototype,$(PROTOTYPE_VERSION))
PROTOTYPE_EMULATOR_INFO = prototype.emulator.yml
PROTOTYPE_DEPENDENCIES = sdl2 sdl2_mixer
PROTOTYPE_LICENSE = GPL-2.0

define PROTOTYPE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/prototype
	$(INSTALL) -m 0755 $(@D)/prototype $(TARGET_DIR)/usr/bin/prototype
	# install media
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/prototype
	touch $(TARGET_DIR)/usr/share/emulationstation/ports/prototype/Prototype.game
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/prototype/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/prototype
	# evmap config
	cp -av $(@D)/Data $(TARGET_DIR)/usr/share/prototype
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/prototype/prototype.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
