################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jul 14, 2025
WINETRICKS_VERSION = 2c76995ed67b5bf3e957e73afb4fbb4734593149
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
