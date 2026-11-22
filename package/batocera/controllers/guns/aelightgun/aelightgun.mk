################################################################################
#
# aelightgun
#
################################################################################

AELIGHTGUN_VERSION = 1
AELIGHTGUN_LICENSE = GPL
AELIGHTGUN_SOURCE =

define AELIGHTGUN_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(AELIGHTGUN_PKGDIR)/99-aelightgun.rules $(TARGET_DIR)/etc/udev/rules.d/99-aelightgun.rules
	$(INSTALL) -m 0755 -D $(AELIGHTGUN_PKGDIR)/virtual-aelightgun-add $(TARGET_DIR)/usr/bin/virtual-aelightgun-add
endef

$(eval $(generic-package))
