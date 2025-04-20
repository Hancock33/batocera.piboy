################################################################################
#
# joycond
#
################################################################################
# Version: Commits on Jun 16, 2022
JOYCOND_VERSION = 39d5728d41b70840342ddc116a59125b337fbde2
JOYCOND_SITE = $(call github,DanielOgorchock,joycond,$(JOYCOND_VERSION))
JOYCOND_LICENSE = GPL-3.0+
JOYCOND_LICENSE_FILES = LICENSE
JOYCOND_DEPENDENCIES = acl libevdev udev

define JOYCOND_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/joycond $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0644 $(@D)/udev/*.rules $(TARGET_DIR)/etc/udev/rules.d/
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/pads/joycond/99-joycond-ignore.rules $(TARGET_DIR)/etc/udev/rules.d/
endef

$(eval $(cmake-package))
