################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on May 31, 2025
WINETRICKS_VERSION = 9e29aa7e2d8e84880aec741ed92eed35baa742ac
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
