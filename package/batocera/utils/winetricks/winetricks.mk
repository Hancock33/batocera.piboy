################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Mar 20, 2023
WINETRICKS_VERSION = a1d5f91585ca06250307a5abc3fedaec68a5f5b6
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef


$(eval $(generic-package))
