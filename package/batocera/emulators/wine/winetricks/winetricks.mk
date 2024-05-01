################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 30, 2024
WINETRICKS_VERSION = be81938a10af4e55cdf2ada1167dd24157aa0e36
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
