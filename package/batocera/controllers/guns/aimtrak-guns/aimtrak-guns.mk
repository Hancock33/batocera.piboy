################################################################################
#
# aimtrak-guns
#
################################################################################

AIMTRAK_GUNS_VERSION = 1
AIMTRAK_GUNS_LICENSE = GPL
AIMTRAK_GUNS_SOURCE =

define AIMTRAK_GUNS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(AIMTRAK_GUNS_PKGDIR)/99-Aimtrak_ATRAK.rules $(TARGET_DIR)/etc/udev/rules.d/99-Aimtrak_ATRAK.rules
	$(INSTALL) -m 0755 -D $(AIMTRAK_GUNS_PKGDIR)/aimtrak-add $(TARGET_DIR)/usr/bin/aimtrak-add
endef

$(eval $(generic-package))
