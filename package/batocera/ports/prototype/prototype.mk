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
	cp -a  $(PROTOTYPE_PKGDIR)/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/prototype
	# game data
	cp -av $(@D)/Data $(TARGET_DIR)/usr/share/prototype
	# evmap config
	$(INSTALL) -m 0644 -D -t $(TARGET_DIR)/usr/share/evmapy $(PROTOTYPE_PKGDIR)/prototype.keys
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
