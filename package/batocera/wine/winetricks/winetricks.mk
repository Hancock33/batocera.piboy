################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 18, 2025
WINETRICKS_VERSION = 47ce157bc3d0f3563d828dcabb868eb1220dd4dd
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
