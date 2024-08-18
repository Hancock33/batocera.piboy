################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 09, 2024
WINETRICKS_VERSION = eeaed1f4651a4b19d56891e588a881936ea7a159
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
