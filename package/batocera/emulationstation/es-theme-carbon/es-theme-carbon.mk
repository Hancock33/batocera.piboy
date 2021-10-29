################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Oct 29, 2021
ES_THEME_CARBON_VERSION = 2386782f511ec33274802c4aedfca37b5561aa05
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
