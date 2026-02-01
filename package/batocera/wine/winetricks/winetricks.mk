################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jan 29, 2026
WINETRICKS_VERSION = c9ec7e27eb01e8f0e46a2d4803c405c38a27cc75
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
