################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jan 26, 2026
WINETRICKS_VERSION = 3483ce867ee10aa084843e97b8f31c9489d6e93d
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
