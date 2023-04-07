################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 05, 2023
WINETRICKS_VERSION = d017f5475f22e31121edc1f19ee98c7327be4b2e
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef


$(eval $(generic-package))
