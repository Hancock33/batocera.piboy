################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Feb 07, 2025
WINETRICKS_VERSION = e73c4d8f71801fe842c0276b603d9c8024d6d957
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
