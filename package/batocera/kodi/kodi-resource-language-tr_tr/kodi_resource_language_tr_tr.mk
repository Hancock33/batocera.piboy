################################################################################
#
# kodi_resource_language_tr_tr
#
################################################################################
# Version: Commits on Nov 14, 2026
KODI_RESOURCE_LANGUAGE_TR_TR_VERSION = 11.0.98
KODI_RESOURCE_LANGUAGE_TR_TR_SOURCE = resource.language.tr_tr-$(KODI_RESOURCE_LANGUAGE_TR_TR_VERSION).zip
KODI_RESOURCE_LANGUAGE_TR_TR_SITE = https://mirrors.kodi.tv/addons/piers/resource.language.tr_tr
KODI_RESOURCE_LANGUAGE_TR_TR_PLUGINNAME = resource.language.tr_tr

define KODI_RESOURCE_LANGUAGE_TR_TR_EXTRACT_CMDS
	$(UNZIP) -q -o $(KODI_RESOURCE_LANGUAGE_TR_TR_DL_DIR)/$(KODI_RESOURCE_LANGUAGE_TR_TR_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_TR_TR_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/kodi/addons/$(KODI_RESOURCE_LANGUAGE_TR_TR_PLUGINNAME)
	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons
	cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_TR_TR_PLUGINNAME) $(TARGET_DIR)/usr/share/kodi/addons/
endef

$(eval $(generic-package))
