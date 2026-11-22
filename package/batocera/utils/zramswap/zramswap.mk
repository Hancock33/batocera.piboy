################################################################################
#
# zramswap
#
################################################################################

ZRAMSWAP_VERSION = 0.0.1
ZRAMSWAP_SOURCE =
ZRAMSWAP_SITE =
ZRAMSWAP_LICENSE = LGPL-3.0+

define ZRAMSWAP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(ZRAMSWAP_PKGDIR)/zramswap $(TARGET_DIR)/usr/share/batocera/services/zramswap
endef

$(eval $(generic-package))
