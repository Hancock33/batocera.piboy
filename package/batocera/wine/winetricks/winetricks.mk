################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jun 20, 2025
WINETRICKS_VERSION = 50417b23b5d3e79c6c8fa4d1af69167dfa3de719
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
