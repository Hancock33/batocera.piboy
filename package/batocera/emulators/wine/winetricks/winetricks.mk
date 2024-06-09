################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jun 06, 2024
WINETRICKS_VERSION = e4dcd5fe2895ea823ec59e0f8224c1701576fdd8
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
