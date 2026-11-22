################################################################################
#
# gpicase
#
################################################################################

GPICASE_VERSION = 2.1
GPICASE_SOURCE =
GPICASE_LICENSE = LGPL-3.0+

define GPICASE_INSTALL_TARGET_CMDS
	mkdir -p $(BINARIES_DIR)/rpi-firmware/overlays
	cp -rf $(GPICASE_PKGDIR)/overlays/* $(BINARIES_DIR)/rpi-firmware/overlays/
	$(INSTALL) -D -m 0644 $(GPICASE_PKGDIR)/99-gpicase.rules $(TARGET_DIR)/etc/udev/rules.d/99-gpicase.rules
	$(INSTALL) -D -m 0755 $(GPICASE_PKGDIR)/batocera-gpicase-install $(TARGET_DIR)/usr/bin/batocera-gpicase-install
endef

$(eval $(generic-package))
