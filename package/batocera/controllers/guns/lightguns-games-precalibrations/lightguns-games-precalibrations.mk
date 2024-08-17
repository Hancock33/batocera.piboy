################################################################################
#
# lightguns-games-precalibrations
#
################################################################################
# Version: Commits on Aug 27, 2023
LIGHTGUNS_GAMES_PRECALIBRATIONS_VERSION = 3b16ec84fc1ad60d5e9f77e04bde2441813ad14e
LIGHTGUNS_GAMES_PRECALIBRATIONS_SITE = $(call github,batocera-linux,lightguns-games-precalibrations,$(LIGHTGUNS_GAMES_PRECALIBRATIONS_VERSION))

define LIGHTGUNS_GAMES_PRECALIBRATIONS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/guns-precalibrations
	cp -pr $(@D)/saves/* $(TARGET_DIR)/usr/share/batocera/guns-precalibrations/
endef

$(eval $(generic-package))
