################################################################################
#
# EmulationStation theme "Carbon"
#
################################################################################
# Version.: Commits on Oct 16, 2021
ES_THEME_CARBON_VERSION = 2641c81d55cce5b748583a49993d37ea375023ab
ES_THEME_CARBON_SITE = $(call github,hancock33,es-theme-carbon,$(ES_THEME_CARBON_VERSION))

define ES_THEME_CARBON_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-carbon
endef

$(eval $(generic-package))
