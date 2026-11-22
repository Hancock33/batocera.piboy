################################################################################
#
# keyboardtopads
#
################################################################################

KEYBOARDTOPADS_VERSION = 1
KEYBOARDTOPADS_LICENSE = GPL
KEYBOARDTOPADS_SOURCE =

define KEYBOARDTOPADS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(KEYBOARDTOPADS_PKGDIR)/99-keyboardtopads.rules $(TARGET_DIR)/etc/udev/rules.d/99-keyboardtopads.rules
	$(INSTALL) -m 0755 -D $(KEYBOARDTOPADS_PKGDIR)/keyboardToPads.py $(TARGET_DIR)/usr/bin/keyboardToPads
	$(INSTALL) -m 0755 -D $(KEYBOARDTOPADS_PKGDIR)/keyboardToPadsLauncher.sh $(TARGET_DIR)/usr/bin/keyboardToPadsLauncher
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/usr/share/keyboardToPads/inputs $(KEYBOARDTOPADS_PKGDIR)/inputs/*.yml
endef

$(eval $(generic-package))
