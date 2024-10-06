################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Oct 01, 2024
WINETRICKS_VERSION = 84215ecb3a771a564575edced8497f81a52a3770
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(SED) "s|    winetricks_latest_version_check|    #winetricks_latest_version_check|g" $(@D)/src/winetricks
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
