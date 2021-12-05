################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Dec 05, 2021
ES_THEME_CARBON_VERSION = ee442b28bb707cbbba61024da09af128f6a4f410
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
