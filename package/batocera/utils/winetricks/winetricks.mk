################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jan 15, 2023
WINETRICKS_VERSION = b26dc5384e4dcfd6aa14beec8554d58696a46458
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef


$(eval $(generic-package))
