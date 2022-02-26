################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Feb 26, 2022
ES_THEME_CARBON_VERSION = fc9baea7a1169b098d32be875def6456d63f1faa
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

define ES_THEME_CARBON_DELETE_EXTRAS
	rm -rf $(@D)/art/background/arcademachines
	rm -rf $(@D)/art/background/category
	rm -rf $(@D)/art/background/extras
	rm -rf $(@D)/art/logos/extras
endef

ES_THEME_CARBON_PRE_INSTALL_TARGET_HOOKS += ES_THEME_CARBON_DELETE_EXTRAS

$(eval $(generic-package))
