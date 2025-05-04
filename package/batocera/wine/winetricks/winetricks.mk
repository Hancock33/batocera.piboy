################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Mar 06, 2025
WINETRICKS_VERSION = 00427b67de70bfefd282d0abc7edd1daa442e73e
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
