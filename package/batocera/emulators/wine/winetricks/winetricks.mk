################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 21, 2024
WINETRICKS_VERSION = 8a4221661800feabca576b444a0c83820bba2936
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
