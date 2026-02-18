################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Feb 18, 2026
WINETRICKS_VERSION = 02af8ba21a6d2648f72b5601f8b8b73a1eeb9e64
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
