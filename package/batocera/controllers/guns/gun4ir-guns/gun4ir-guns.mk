################################################################################
#
# gun4ir-guns
#
################################################################################

GUN4IR_GUNS_VERSION = 1
GUN4IR_GUNS_LICENSE = GPL
GUN4IR_GUNS_SOURCE =

define GUN4IR_GUNS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(GUN4IR_GUNS_PKGDIR)/99-gun4ir.rules $(TARGET_DIR)/etc/udev/rules.d/99-gun4ir.rules
	$(INSTALL) -m 0755 -D $(GUN4IR_GUNS_PKGDIR)/virtual-gun4ir-add $(TARGET_DIR)/usr/bin/virtual-gun4ir-add
endef

$(eval $(generic-package))
