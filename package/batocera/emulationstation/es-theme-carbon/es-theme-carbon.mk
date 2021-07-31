################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Jul 31, 2021
ES_THEME_CARBON_VERSION = 8677ed8f5adabe1b2e9a84d78e272c354e23d886
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
