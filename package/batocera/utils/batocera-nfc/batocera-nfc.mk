################################################################################
#
# batocera-nfc
#
################################################################################

BATOCERA_NFC_VERSION = 1.0
BATOCERA_NFC_LICENSE = GPL
BATOCERA_NFC_SOURCE =

define BATOCERA_NFC_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BATOCERA_NFC_PKGDIR)/batocera-nfc.py $(TARGET_DIR)/usr/bin/batocera-nfc
	$(INSTALL) -D -m 0755 $(BATOCERA_NFC_PKGDIR)/scripts/on-nfc-connect/default.sh    $(TARGET_DIR)/usr/share/batocera/scripts/on-nfc-connect/default.sh
	$(INSTALL) -D -m 0755 $(BATOCERA_NFC_PKGDIR)/scripts/on-nfc-disconnect/default.sh $(TARGET_DIR)/usr/share/batocera/scripts/on-nfc-disconnect/default.sh
	# service
	$(INSTALL) -D -m 0755 $(BATOCERA_NFC_PKGDIR)/batocera-nfc.service $(TARGET_DIR)/usr/share/batocera/services/simple_nfc
endef

$(eval $(generic-package))
