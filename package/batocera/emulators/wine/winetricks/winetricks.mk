################################################################################
#
# winetricks
#
################################################################################
# Version: Commits on Sept 22, 2024
WINETRICKS_VERSION = 80136a8d80e8124896cdfb97badcc85e8ef2facd
WINETRICKS_SITE = $(call github,Winetricks,winetricks,$(WINETRICKS_VERSION))

define WINETRICKS_INSTALL_TARGET_CMDS
	$(SED) "s|    winetricks_latest_version_check|    #winetricks_latest_version_check|g" $(@D)/src/winetricks
	$(INSTALL) -D $(@D)/src/winetricks $(TARGET_DIR)/usr/wine/winetricks
endef

$(eval $(generic-package))
