################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Aug 10, 2026
WINETRICKS_VERSION = f3890f670867b5ffbc3938726db45c0f7d16c8ba
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))
WINETRICKS_LICENSE = LGPL-2.1+
WINETRICKS_LICENSE_FILES = COPYING

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
