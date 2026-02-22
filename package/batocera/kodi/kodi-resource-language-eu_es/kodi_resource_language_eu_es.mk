################################################################################
#
# kodi_resource_language_eu_es
#
################################################################################
# Version: Commits on Feb 14, 2026
KODI_RESOURCE_LANGUAGE_EU_ES_VERSION = 11.0.73
KODI_RESOURCE_LANGUAGE_EU_ES_SOURCE = resource.language.eu_es-$(KODI_RESOURCE_LANGUAGE_EU_ES_VERSION).zip
KODI_RESOURCE_LANGUAGE_EU_ES_SITE = http://mirrors.kodi.tv/addons/piers/resource.language.eu_es
KODI_RESOURCE_LANGUAGE_EU_ES_PLUGINNAME=resource.language.eu_es

KODI_RESOURCE_LANGUAGE_EU_ES_CP_DIR=$(TARGET_DIR)/usr/share/kodi/addons

define KODI_RESOURCE_LANGUAGE_EU_ES_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(KODI_RESOURCE_LANGUAGE_EU_ES_DL_SUBDIR)/$(KODI_RESOURCE_LANGUAGE_EU_ES_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_EU_ES_INSTALL_TARGET_CMDS
	@mkdir -p $(KODI_RESOURCE_LANGUAGE_EU_ES_CP_DIR)
	@cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_EU_ES_PLUGINNAME) $(KODI_RESOURCE_LANGUAGE_EU_ES_CP_DIR)
endef

$(eval $(generic-package))
