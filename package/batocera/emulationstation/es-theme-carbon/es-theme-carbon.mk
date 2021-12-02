################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Dec 02, 2021
ES_THEME_CARBON_VERSION = 566b23b5068079742ede1d4258046caeed75aa66
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
