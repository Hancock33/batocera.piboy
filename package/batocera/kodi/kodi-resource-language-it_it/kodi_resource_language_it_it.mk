################################################################################
#
# kodi_resource_language_it_it
#
################################################################################
# Version: Commits on Nov 14, 2026
KODI_RESOURCE_LANGUAGE_IT_IT_VERSION = 11.0.113
KODI_RESOURCE_LANGUAGE_IT_IT_SOURCE = resource.language.it_it-$(KODI_RESOURCE_LANGUAGE_IT_IT_VERSION).zip
KODI_RESOURCE_LANGUAGE_IT_IT_SITE = https://mirrors.kodi.tv/addons/piers/resource.language.it_it
KODI_RESOURCE_LANGUAGE_IT_IT_PLUGINNAME = resource.language.it_it

define KODI_RESOURCE_LANGUAGE_IT_IT_EXTRACT_CMDS
	$(UNZIP) -q -o $(KODI_RESOURCE_LANGUAGE_IT_IT_DL_DIR)/$(KODI_RESOURCE_LANGUAGE_IT_IT_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_IT_IT_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/kodi/addons/$(KODI_RESOURCE_LANGUAGE_IT_IT_PLUGINNAME)
	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons
	cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_IT_IT_PLUGINNAME) $(TARGET_DIR)/usr/share/kodi/addons/
endef

$(eval $(generic-package))
