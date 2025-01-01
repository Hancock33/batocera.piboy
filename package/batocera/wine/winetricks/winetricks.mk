################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Dec 26, 2024
WINETRICKS_VERSION = 98078f5d2e5901d2524e6b16930451c42aff8c18
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
