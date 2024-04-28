################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 27, 2024
WINETRICKS_VERSION = bc2ff55a63ccbf62be8bb163d57e12b7955a2842
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
