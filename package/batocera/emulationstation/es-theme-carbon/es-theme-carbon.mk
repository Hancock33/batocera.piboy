################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Jul 19, 2021
ES_THEME_CARBON_VERSION = 2a39170c5928141481bda6619212372f3f36d86d
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
