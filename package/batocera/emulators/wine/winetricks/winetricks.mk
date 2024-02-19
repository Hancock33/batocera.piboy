################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Feb 19, 2024
WINETRICKS_VERSION = 02a555d6b17b80f5fadbaef9a29902661fd5a77d
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
