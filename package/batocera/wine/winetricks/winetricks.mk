################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Sept 24, 2025
WINETRICKS_VERSION = 5a543dbc7bcb2465f3fb77bcfb28c0fc21d508b5
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
