################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Dec 19, 2024
WINETRICKS_VERSION = cede5047101299802a9756f0885e24a5b6f2fbb5
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
