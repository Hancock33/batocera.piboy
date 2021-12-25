################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Dec 25, 2021
ES_THEME_CARBON_VERSION = 82d2edc1724ee98317418a48f81d9fc95252530f
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
