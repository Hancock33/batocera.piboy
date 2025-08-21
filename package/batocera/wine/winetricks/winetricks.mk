################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 03, 2025
WINETRICKS_VERSION = 73b92d2f3c117cd21d96e2fc807e041e7a89fec3
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
