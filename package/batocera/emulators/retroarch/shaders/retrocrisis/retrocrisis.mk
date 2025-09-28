################################################################################
#
# retrocrisis
#
################################################################################
# Version: Commits on Sept 28, 2025
RETROCRISIS_VERSION = 20250928
RETROCRISIS_DATE = $(shell date -d '$(RETROCRISIS_VERSION)' +'%Y.%m.%d')
RETROCRISIS_SITE = https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC/releases/download/$(subst .,,$(RETROCRISIS_VERSION))
RETROCRISIS_SOURCE = Retro.Crisis.GDV-NTSC.$(RETROCRISIS_DATE).zip
RETROCRISIS_LICENSE = GPL-3.0

define RETROCRISIS_EXTRACT_CMDS
	unzip $(RETROCRISIS_DL_DIR)/$(RETROCRISIS_SOURCE) -d $(@D)
	find $(@D) -type f -name "*.slangp" -exec $(SED) "s|../../../shaders_slang|/usr/share/batocera/shaders|g" {} \;
endef

define RETROCRISIS_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/batocera/shaders/retrocrisis
	mkdir -p $(TARGET_DIR)/usr/share/batocera/shaders
	cp -ar $(@D)/shaders/shaders_slang/retro* $(TARGET_DIR)/usr/share/batocera/shaders/retrocrisis
endef

$(eval $(generic-package))
