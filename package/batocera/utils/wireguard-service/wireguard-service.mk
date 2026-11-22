################################################################################
#
# wireguard-service
#
################################################################################

WIREGUARD_SERVICE_VERSION = 0.0.1
WIREGUARD_SERVICE_SOURCE =
WIREGUARD_SERVICE_SITE =
WIREGUARD_SERVICE_LICENSE = LGPL-3.0+

WIREGUARD_SERVICE_DEPENDENCIES = wireguard-tools

define WIREGUARD_SERVICE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/etc
	rm -rf $(TARGET_DIR)/etc/wireguard
	ln -sf /userdata/system/wireguard $(TARGET_DIR)/etc/wireguard
	$(INSTALL) -D -m 0755 $(WIREGUARD_SERVICE_PKGDIR)/wireguard $(TARGET_DIR)/usr/share/batocera/services/wireguard
endef

$(eval $(generic-package))
