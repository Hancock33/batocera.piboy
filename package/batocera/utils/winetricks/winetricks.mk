################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on May 05, 2023
WINETRICKS_VERSION = 84fe491b2d17e991efc9aa2c602813ce865030d5
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef


$(eval $(generic-package))
