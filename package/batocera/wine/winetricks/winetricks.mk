################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Mar 25, 2026
WINETRICKS_VERSION = 205d3c652e1de440de8ccb39ce99fe877109a0bb
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
