################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Nov 04, 2025
WINETRICKS_VERSION = 533f41704766765cfb3706fb2aa197acbb05df32
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
