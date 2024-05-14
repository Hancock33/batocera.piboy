################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on May 14, 2024
WINETRICKS_VERSION = 383292899865c41d7f9e5e77c3f09b73e72a0fde
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
