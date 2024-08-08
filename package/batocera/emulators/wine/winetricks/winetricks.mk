################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 06, 2024
WINETRICKS_VERSION = b66eb9f53943f7d7582b7f3ba7969ce6e5182a32
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
