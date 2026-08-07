################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 07, 2026
WINETRICKS_VERSION = 5a59ea07513b24093bd90fad943ecf9543cf05bc
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
