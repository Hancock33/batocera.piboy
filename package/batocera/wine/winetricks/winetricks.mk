################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Feb 21, 2026
WINETRICKS_VERSION = b792287f5bec9086916aa9b81788e0ea38f02c24
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
