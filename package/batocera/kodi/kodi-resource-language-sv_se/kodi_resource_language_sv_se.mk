################################################################################
#
# kodi_resource_language_sv_se
#
################################################################################
# Version: Commits on Nov 14, 2026
KODI_RESOURCE_LANGUAGE_SV_SE_VERSION = 11.0.106
KODI_RESOURCE_LANGUAGE_SV_SE_SOURCE = resource.language.sv_se-$(KODI_RESOURCE_LANGUAGE_SV_SE_VERSION).zip
KODI_RESOURCE_LANGUAGE_SV_SE_SITE = https://mirrors.kodi.tv/addons/piers/resource.language.sv_se
KODI_RESOURCE_LANGUAGE_SV_SE_PLUGINNAME = resource.language.sv_se

define KODI_RESOURCE_LANGUAGE_SV_SE_EXTRACT_CMDS
	$(UNZIP) -q -o $(KODI_RESOURCE_LANGUAGE_SV_SE_DL_DIR)/$(KODI_RESOURCE_LANGUAGE_SV_SE_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_SV_SE_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/kodi/addons/$(KODI_RESOURCE_LANGUAGE_SV_SE_PLUGINNAME)
	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons
	cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_SV_SE_PLUGINNAME) $(TARGET_DIR)/usr/share/kodi/addons/
endef

$(eval $(generic-package))
