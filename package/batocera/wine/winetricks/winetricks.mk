################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 24, 2025
WINETRICKS_VERSION = 4a2830491750329b9ca606233d3bc2a02ea65205
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
