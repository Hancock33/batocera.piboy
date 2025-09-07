################################################################################
#
# es-theme-carbon
#
################################################################################
# Version: Commits on Sept 07, 2025
ES_THEME_CARBON_VERSION = 1459990394cca99f762764c58b2c05b24eda6385
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
	cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

define ES_THEME_CARBON_DELETE_EXTRAS
	rm -rf $(@D)/art/background/arcademachines
	rm -rf $(@D)/art/background/category
	rm -rf $(@D)/art/background/extras
	rm -rf $(@D)/art/consoles/extras
	rm -rf $(@D)/art/controllers/extras
	rm -rf $(@D)/art/logos/extras
endef

ES_THEME_CARBON_PRE_INSTALL_TARGET_HOOKS += ES_THEME_CARBON_DELETE_EXTRAS

$(eval $(generic-package))
