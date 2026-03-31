################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Mar 14, 2026
WINETRICKS_VERSION = 55aacc98766a9053a3e56a7662051f2531818b5f
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
