################################################################################
#
# lightguns-games-precalibrations
#
################################################################################
# Version: Commits on Oct 08, 2026
LIGHTGUNS_GAMES_PRECALIBRATIONS_VERSION = cdaf9ac06422f06bf89a34eab62676f90f3c6f0a
LIGHTGUNS_GAMES_PRECALIBRATIONS_SITE = $(call github,batocera-linux,lightguns-games-precalibrations,$(LIGHTGUNS_GAMES_PRECALIBRATIONS_VERSION))

define LIGHTGUNS_GAMES_PRECALIBRATIONS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/guns-precalibrations
	cp -pr $(@D)/saves/* $(TARGET_DIR)/usr/share/batocera/guns-precalibrations/
endef

$(eval $(generic-package))
