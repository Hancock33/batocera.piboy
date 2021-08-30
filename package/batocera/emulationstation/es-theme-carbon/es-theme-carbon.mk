################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Aug 30, 2021
ES_THEME_CARBON_VERSION = c27ce5ac7fa711b286eb1da55a2f3165c1948318
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
