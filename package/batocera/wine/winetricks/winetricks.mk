################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Nov 02, 2025
WINETRICKS_VERSION = 81a692e2ee6b311367f18a17a9a61a0ef1c0ad18
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
