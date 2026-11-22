################################################################################
#
# kodi_resource_language_fr_fr
#
################################################################################
# Version: Commits on Nov 14, 2026
KODI_RESOURCE_LANGUAGE_FR_FR_VERSION = 11.0.111
KODI_RESOURCE_LANGUAGE_FR_FR_SOURCE = resource.language.fr_fr-$(KODI_RESOURCE_LANGUAGE_FR_FR_VERSION).zip
KODI_RESOURCE_LANGUAGE_FR_FR_SITE = https://mirrors.kodi.tv/addons/piers/resource.language.fr_fr
KODI_RESOURCE_LANGUAGE_FR_FR_PLUGINNAME = resource.language.fr_fr

define KODI_RESOURCE_LANGUAGE_FR_FR_EXTRACT_CMDS
	$(UNZIP) -q -o $(KODI_RESOURCE_LANGUAGE_FR_FR_DL_DIR)/$(KODI_RESOURCE_LANGUAGE_FR_FR_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_FR_FR_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/kodi/addons/$(KODI_RESOURCE_LANGUAGE_FR_FR_PLUGINNAME)
	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons
	cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_FR_FR_PLUGINNAME) $(TARGET_DIR)/usr/share/kodi/addons/
endef

$(eval $(generic-package))
