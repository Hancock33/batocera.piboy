################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jul 15, 2023
WINETRICKS_VERSION = 37aeb0bf34f0d6d2318276a6b4d96340d14621c3
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef


$(eval $(generic-package))
