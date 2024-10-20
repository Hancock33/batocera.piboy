################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Oct 17, 2024
WINETRICKS_VERSION = a06ea8795482d2f49a5461ab5f23e0036e38d12b
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(SED) "s|    winetricks_latest_version_check|    #winetricks_latest_version_check|g" $(@D)/src/winetricks
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
