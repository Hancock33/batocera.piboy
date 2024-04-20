################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Apr 18, 2024
WINETRICKS_VERSION = 44fcb61f7d0fda7467215b2d92262a57cc296ad1
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
