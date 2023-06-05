################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on May 31, 2023
WINETRICKS_VERSION = e9454179686b3659ad3f47a5d49e6e4e82862cd5
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef


$(eval $(generic-package))
