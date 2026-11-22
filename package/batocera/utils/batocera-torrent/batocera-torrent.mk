################################################################################
#
# batocera-torrent
#
################################################################################

BATOCERA_TORRENT_VERSION = 1
BATOCERA_TORRENT_LICENSE = GPL
BATOCERA_TORRENT_SOURCE =

define BATOCERA_TORRENT_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BATOCERA_TORRENT_PKGDIR)/batocera-upgrade-torrent $(TARGET_DIR)/usr/bin/batocera-upgrade-torrent
	$(INSTALL) -D -m 0755 $(BATOCERA_TORRENT_PKGDIR)/batocera-torrent.service $(TARGET_DIR)/usr/share/batocera/services/batocera_torrent
endef

$(eval $(generic-package))
