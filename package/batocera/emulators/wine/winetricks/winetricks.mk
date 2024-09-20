################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Sept 13, 2024
WINETRICKS_VERSION = b8d145a95171e3d9a58ed0bd37bf2bae64d8230f
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
