################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 09, 2026
WINETRICKS_VERSION = 08304e81f9ac9a83c552a6bd78689040d174bf95
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
