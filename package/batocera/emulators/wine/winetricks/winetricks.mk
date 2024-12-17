################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Nov 15, 2024
WINETRICKS_VERSION = df750bc8b0b7ac77a39c50e852da6f18cfc9402e
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
