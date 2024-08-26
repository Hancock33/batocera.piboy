################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 13, 2024
WINETRICKS_VERSION = 72b934e1e10c041ec6986f5f2fb4f143d8f6b941
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
