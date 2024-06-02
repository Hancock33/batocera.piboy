################################################################################
#
# retrocrisis
#
################################################################################
# Version: Commits on May 31, 2024
RETROCRISIS_VERSION = 2024.05.31
RETROCRISIS_SITE = https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC/releases/download/$(subst .,,$(RETROCRISIS_VERSION))
RETROCRISIS_SOURCE = Retro.Crisis.GDV-NTSC.$(RETROCRISIS_VERSION).zip
RETROCRISIS_LICENSE = GPL-3.0

define RETROCRISIS_EXTRACT_CMDS
	unzip $(RETROCRISIS_DL_DIR)/$(RETROCRISIS_SOURCE) -d $(@D)
	find $(@D) -type f  -name "*.slangp" -exec $(SED) "s|../../../shaders_slang|/usr/share/batocera/shaders|g" {} \;
endef

define RETROCRISIS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/shaders
	cp -ar $(@D)/shaders $(TARGET_DIR)/usr/share/batocera
endef

$(eval $(generic-package))
