################################################################################
#
# batocera-steam
#
################################################################################

BATOCERA_STEAM_VERSION = 1
BATOCERA_STEAM_SOURCE =
BATOCERA_STEAM_LICENSE = LGPL-3.0+
BATOCERA_STEAM_EMULATOR_INFO = steam.emulator.yml

define BATOCERA_STEAM_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 -t $(TARGET_DIR)/usr/bin \
		$(BATOCERA_STEAM_PKGDIR)/batocera-steam \
		$(BATOCERA_STEAM_PKGDIR)/batocera-steam-update \
		$(BATOCERA_STEAM_PKGDIR)/batocera-steam-exit
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
