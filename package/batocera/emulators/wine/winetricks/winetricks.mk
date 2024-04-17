################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 17, 2024
WINETRICKS_VERSION = 23de3a8dcdc98bc3a3d41995ad2d6b46eb3eba55
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
