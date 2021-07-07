################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Jul 07, 2021
ES_THEME_CARBON_VERSION = f7f3a625f4dc33a8e3ce8c0260f2bf77c9794d04
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
