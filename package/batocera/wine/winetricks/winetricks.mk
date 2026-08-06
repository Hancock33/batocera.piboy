################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 01, 2026
WINETRICKS_VERSION = 8e6f0d529b0077bc8602c5de62a08583c7cd0f4e
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
