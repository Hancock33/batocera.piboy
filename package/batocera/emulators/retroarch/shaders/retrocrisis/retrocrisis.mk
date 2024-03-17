################################################################################
#
# retrocrisis
#
################################################################################
# Version: Commits on Mar 14, 2024
RETROCRISIS_VERSION = 2024.03.14
RETROCRISIS_SITE = https://github.com/RetroCrisis/Retro-Crisis-GDV-NTSC/releases/download/$(subst .,,$(RETROCRISIS_VERSION))
RETROCRISIS_SOURCE = Retro.Crisis.GDV-NTSC.$(RETROCRISIS_VERSION).zip
RETROCRISIS_LICENSE = GPL-3.0

define RETROCRISIS_EXTRACT_CMDS
	unzip $(RETROCRISIS_DL_DIR)/$(RETROCRISIS_SOURCE) -d $(@D)
endef

define RETROCRISIS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/batocera/shaders
	cp -avr $(@D)/shaders $(TARGET_DIR)/usr/share/batocera
endef

$(eval $(generic-package))
