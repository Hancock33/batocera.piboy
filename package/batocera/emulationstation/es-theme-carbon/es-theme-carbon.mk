################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Aug 20, 2021
ES_THEME_CARBON_VERSION = 5b58f145c355f0522ae64bbc2ad9ad4ba11624c4
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
