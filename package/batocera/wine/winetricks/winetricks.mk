################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 25, 2025
WINETRICKS_VERSION = 9a399f26a42db7c0c8c9c9688c8b98ffc38d22f6
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
