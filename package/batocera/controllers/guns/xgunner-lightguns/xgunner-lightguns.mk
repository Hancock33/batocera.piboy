################################################################################
#
# xgunner-lightguns
#
################################################################################

XGUNNER_LIGHTGUNS_VERSION = 1
XGUNNER_LIGHTGUNS_LICENSE = GPL
XGUNNER_LIGHTGUNS_SOURCE =

define XGUNNER_LIGHTGUNS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(XGUNNER_LIGHTGUNS_PKGDIR)/99-xgunner-lightguns.rules \
		$(TARGET_DIR)/etc/udev/rules.d/99-xgunner-lightguns.rules
	$(INSTALL) -m 0755 -D $(XGUNNER_LIGHTGUNS_PKGDIR)/xgunner-lightguns-add \
		$(TARGET_DIR)/usr/bin/xgunner-lightguns-add
endef

$(eval $(generic-package))
