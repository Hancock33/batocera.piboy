################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Feb 07, 2026
WINETRICKS_VERSION = b89b0ed14de98368a42e4b784bfe05c509329f35
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
