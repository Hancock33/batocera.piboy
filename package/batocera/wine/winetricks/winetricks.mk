################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Feb 18, 2026
WINETRICKS_VERSION = abbbf7f40ac5a3d2dbb4fbcba9ec138331fee4f3
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
