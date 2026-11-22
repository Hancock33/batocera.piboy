################################################################################
#
# kodi_resource_language_de_de
#
################################################################################
# Version: Commits on Nov 14, 2026
KODI_RESOURCE_LANGUAGE_DE_DE_VERSION = 11.0.113
KODI_RESOURCE_LANGUAGE_DE_DE_SOURCE = resource.language.de_de-$(KODI_RESOURCE_LANGUAGE_DE_DE_VERSION).zip
KODI_RESOURCE_LANGUAGE_DE_DE_SITE = https://mirrors.kodi.tv/addons/piers/resource.language.de_de
KODI_RESOURCE_LANGUAGE_DE_DE_PLUGINNAME = resource.language.de_de

define KODI_RESOURCE_LANGUAGE_DE_DE_EXTRACT_CMDS
	$(UNZIP) -q -o $(KODI_RESOURCE_LANGUAGE_DE_DE_DL_DIR)/$(KODI_RESOURCE_LANGUAGE_DE_DE_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_DE_DE_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/kodi/addons/$(KODI_RESOURCE_LANGUAGE_DE_DE_PLUGINNAME)
	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons
	cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_DE_DE_PLUGINNAME) $(TARGET_DIR)/usr/share/kodi/addons/
endef

$(eval $(generic-package))
