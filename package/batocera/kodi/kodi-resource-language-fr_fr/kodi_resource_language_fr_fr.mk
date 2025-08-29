################################################################################
#
# kodi_resource_language_fr_fr
#
################################################################################
# Version: Commits on Aug 13, 2025
KODI_RESOURCE_LANGUAGE_FR_FR_VERSION = 11.0.95
KODI_RESOURCE_LANGUAGE_FR_FR_SOURCE = resource.language.fr_fr-$(KODI_RESOURCE_LANGUAGE_FR_FR_VERSION).zip
KODI_RESOURCE_LANGUAGE_FR_FR_SITE = http://mirrors.kodi.tv/addons/piers/resource.language.fr_fr
KODI_RESOURCE_LANGUAGE_FR_FR_PLUGINNAME=resource.language.fr_fr

KODI_RESOURCE_LANGUAGE_FR_FR_CP_DIR=$(TARGET_DIR)/usr/share/kodi/addons

define KODI_RESOURCE_LANGUAGE_FR_FR_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(KODI_RESOURCE_LANGUAGE_FR_FR_DL_SUBDIR)/$(KODI_RESOURCE_LANGUAGE_FR_FR_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_FR_FR_INSTALL_TARGET_CMDS
	@mkdir -p $(KODI_RESOURCE_LANGUAGE_FR_FR_CP_DIR)
	@cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_FR_FR_PLUGINNAME) $(KODI_RESOURCE_LANGUAGE_FR_FR_CP_DIR)
endef

$(eval $(generic-package))
