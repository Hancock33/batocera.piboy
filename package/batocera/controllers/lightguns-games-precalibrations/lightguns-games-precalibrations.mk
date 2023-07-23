################################################################################
#
# lightguns-games-precalibrations
#
################################################################################
# Version: Commits on Dec 03, 2022
LIGHTGUNS_GAMES_PRECALIBRATIONS_VERSION = b54cd030a4a549444248c1b41db012fe7aa42171
LIGHTGUNS_GAMES_PRECALIBRATIONS_SITE = $(call github,batocera-linux,lightguns-games-precalibrations,$(LIGHTGUNS_GAMES_PRECALIBRATIONS_VERSION))

define LIGHTGUNS_GAMES_PRECALIBRATIONS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/guns-precalibrations
	cp -pr $(@D)/saves/* $(TARGET_DIR)/usr/share/batocera/guns-precalibrations/
endef

$(eval $(generic-package))
