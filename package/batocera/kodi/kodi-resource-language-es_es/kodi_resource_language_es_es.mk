################################################################################
#
# kodi_resource_language_es_es
#
################################################################################
# Version: Commits on Nov 14, 2026
KODI_RESOURCE_LANGUAGE_ES_ES_VERSION = 11.0.110
KODI_RESOURCE_LANGUAGE_ES_ES_SOURCE = resource.language.es_es-$(KODI_RESOURCE_LANGUAGE_ES_ES_VERSION).zip
KODI_RESOURCE_LANGUAGE_ES_ES_SITE = https://mirrors.kodi.tv/addons/piers/resource.language.es_es
KODI_RESOURCE_LANGUAGE_ES_ES_PLUGINNAME = resource.language.es_es

define KODI_RESOURCE_LANGUAGE_ES_ES_EXTRACT_CMDS
	$(UNZIP) -q -o $(KODI_RESOURCE_LANGUAGE_ES_ES_DL_DIR)/$(KODI_RESOURCE_LANGUAGE_ES_ES_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_ES_ES_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/kodi/addons/$(KODI_RESOURCE_LANGUAGE_ES_ES_PLUGINNAME)
	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons
	cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_ES_ES_PLUGINNAME) $(TARGET_DIR)/usr/share/kodi/addons/
endef

$(eval $(generic-package))
