################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on May 09, 2024
WINETRICKS_VERSION = 14156c0080484423594f3a3b4a0baa52e6b8d171
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
