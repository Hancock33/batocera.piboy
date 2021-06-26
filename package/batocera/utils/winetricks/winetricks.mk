################################################################################
#
# winetricks
#
################################################################################
# Version.: Commits on Jun 17, 2021
WINETRICKS_VERSION = 1b4f353bb3563b119618b74b7514098f72fc6154
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef


$(eval $(generic-package))
