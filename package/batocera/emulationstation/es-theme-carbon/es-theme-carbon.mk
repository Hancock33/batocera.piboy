################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Jun 25, 2021
ES_THEME_CARBON_VERSION = dad33256a334abdc0afd96520b9bd61f293e36e8
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
