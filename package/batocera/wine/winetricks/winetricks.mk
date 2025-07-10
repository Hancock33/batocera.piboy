################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jul 10, 2025
WINETRICKS_VERSION = 5eed63521781ffc2f0c4bbee7ec9e215b13a1243
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
