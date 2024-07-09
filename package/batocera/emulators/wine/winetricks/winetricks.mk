################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jul 09, 2024
WINETRICKS_VERSION = a41ce69ee7b77e717c296e079f53cc2a19035fc7
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
