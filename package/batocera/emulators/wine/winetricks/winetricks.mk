################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jul 21, 2024
WINETRICKS_VERSION = 08ba97a89963d0672cf68f5d5c1e55322ff48448
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(SED) "s|    winetricks_latest_version_check|    #winetricks_latest_version_check|g" $(@D)/src/winetricks
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
