################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Oct 06, 2025
WINETRICKS_VERSION = a5a76f24a5d03697cab0c3192843a4379d6f8ff6
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
