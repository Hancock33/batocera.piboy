################################################################################
#
# batocera-ethtool
#
################################################################################

BATOCERA_ETHTOOL_LICENSE = LGPL-3.0+

define BATOCERA_ETHTOOL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(BATOCERA_ETHTOOL_PKGDIR)/99-wol.rules $(TARGET_DIR)/etc/udev/rules.d/99-wol.rules
endef

$(eval $(generic-package))
