################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Sept 06, 2025
WINETRICKS_VERSION = 13bf50cbf84e00a7d5a0f13e1beefad306d58622
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
