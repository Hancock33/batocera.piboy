################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Jun 03, 2024
WINETRICKS_VERSION = 8ffdb53f5aebfe51502ecceb0d5e7994ad814424
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
