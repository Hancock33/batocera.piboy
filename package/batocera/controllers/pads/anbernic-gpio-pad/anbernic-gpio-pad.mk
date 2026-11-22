################################################################################
#
# anbernic-gpio-pad
#
################################################################################

ANBERNIC_GPIO_PAD_VERSION = 1.5
ANBERNIC_GPIO_PAD_LICENSE = GPL
ANBERNIC_GPIO_PAD_SOURCE =

define ANBERNIC_GPIO_PAD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(ANBERNIC_GPIO_PAD_PKGDIR)/99-anbernic-gpio-pad.rules \
		$(TARGET_DIR)/etc/udev/rules.d/99-anbernic-gpio-pad.rules
	$(INSTALL) -m 0755 -D $(ANBERNIC_GPIO_PAD_PKGDIR)/anbernic-gpio-pad-add \
		$(TARGET_DIR)/usr/bin/anbernic-gpio-pad-add
endef

$(eval $(generic-package))
