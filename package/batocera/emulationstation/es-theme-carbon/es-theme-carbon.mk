################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Sept 02, 2021
ES_THEME_CARBON_VERSION = 723b4970637615d313a1ae4040b42e4e23449cfd
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
