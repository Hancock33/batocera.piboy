################################################################################
#
# samco-guns
#
################################################################################

SAMCO_GUNS_VERSION = 1
SAMCO_GUNS_LICENSE = GPL
SAMCO_GUNS_SOURCE =

define SAMCO_GUNS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(SAMCO_GUNS_PKGDIR)/99-samco-guns.rules $(TARGET_DIR)/etc/udev/rules.d/99-samco-guns.rules
	$(INSTALL) -m 0755 -D $(SAMCO_GUNS_PKGDIR)/virtual-samco-gun-status $(TARGET_DIR)/usr/bin/virtual-samco-gun-status
endef

$(eval $(generic-package))
