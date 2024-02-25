################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Feb 23, 2024
WINETRICKS_VERSION = f87bf9e6a7c67a06487a1ef710c0d9c548ae6f01
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
