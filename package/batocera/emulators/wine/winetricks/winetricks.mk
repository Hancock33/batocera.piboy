################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Oct 09, 2024
WINETRICKS_VERSION = bda76d06666a13f702c14cc7249b803c28d5346c
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(SED) "s|    winetricks_latest_version_check|    #winetricks_latest_version_check|g" $(@D)/src/winetricks
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
