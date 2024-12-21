################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Dec 21, 2024
WINETRICKS_VERSION = 0d6c87165cfad2dd95c3d55200b332947b5af39b
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
