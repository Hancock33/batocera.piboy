################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Feb 16, 2024
WINETRICKS_VERSION = a9a556719e4fd28fc5984a963e2d666ec809f554
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
