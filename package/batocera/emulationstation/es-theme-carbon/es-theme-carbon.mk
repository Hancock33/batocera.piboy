################################################################################
#
# es-theme-carbon
#
################################################################################
# Version: Commits on Oct 25, 2023
ES_THEME_CARBON_VERSION = 554de60d7a9d63b342d78e0b79bd12fba6761993
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
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
