################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 11, 2023
WINETRICKS_VERSION = 2d8b9c62a58ff8dca889c6316f53a348b8cdc5c8
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef


$(eval $(generic-package))
