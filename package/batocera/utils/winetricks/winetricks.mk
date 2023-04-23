################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 19, 2023
WINETRICKS_VERSION = b46dd63e024a166aa38ed8c45d04730eb3276bc1
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef


$(eval $(generic-package))
