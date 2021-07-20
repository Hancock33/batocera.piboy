################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Jul 20, 2021
ES_THEME_CARBON_VERSION = 2697a27be896ecc756029ecdb9585fb0aa71bd6c
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
