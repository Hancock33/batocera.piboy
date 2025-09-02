################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 25, 2025
WINETRICKS_VERSION = 75118236ac5cb6f51918460a14f7bc40162a115e
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
