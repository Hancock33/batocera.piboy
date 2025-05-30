################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on May 29, 2025
WINETRICKS_VERSION = 89e18c2a8c09b97b79e1025fbf5e5b03f1182337
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
