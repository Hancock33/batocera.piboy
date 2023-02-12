################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Feb 10, 2023
WINETRICKS_VERSION = 92dffad7e8ffc0704e92f90f579dad0cf30b8bcb
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef


$(eval $(generic-package))
