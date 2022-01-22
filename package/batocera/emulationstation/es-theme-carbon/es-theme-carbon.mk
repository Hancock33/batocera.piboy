################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Jan 21, 2022
ES_THEME_CARBON_VERSION = 447ce66741ed8941bfd5276f7c4e7e37a9447665
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
