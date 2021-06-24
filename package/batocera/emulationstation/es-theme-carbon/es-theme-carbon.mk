################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Jun 24, 2021
ES_THEME_CARBON_VERSION = 07eec4f03a5c723d04860168a71cd345eda76a38
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
