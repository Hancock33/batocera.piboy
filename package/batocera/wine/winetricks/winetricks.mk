################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jun 11, 2025
WINETRICKS_VERSION = 9279fc0acdb7501a68258fe2da8424774e79b860
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
