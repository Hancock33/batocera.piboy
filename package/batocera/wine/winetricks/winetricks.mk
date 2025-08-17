################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 09, 2025
WINETRICKS_VERSION = 9006a3663212c11cd2c491c47cd9d95ba38fe29c
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
