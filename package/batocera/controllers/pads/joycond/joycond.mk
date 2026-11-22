################################################################################
#
# joycond
#
################################################################################
# Version: Commits on Nov 08, 2026
JOYCOND_VERSION = 4fe23eed61965e951402520d872ab497c8c93703
JOYCOND_SITE = $(call github,DanielOgorchock,joycond,$(JOYCOND_VERSION))
JOYCOND_LICENSE = GPL-3.0+
JOYCOND_LICENSE_FILES = LICENSE
JOYCOND_DEPENDENCIES = acl libevdev udev

define JOYCOND_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/joycond $(TARGET_DIR)/usr/bin/joycond
	$(INSTALL) -D -m 0644 -t $(TARGET_DIR)/etc/udev/rules.d $(@D)/udev/*.rules $(JOYCOND_PKGDIR)/99-joycond-ignore.rules
endef

$(eval $(cmake-package))
