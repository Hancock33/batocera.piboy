################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 10, 2026
WINETRICKS_VERSION = 14b802e419aff260b9d630e71027d88855e224e7
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
