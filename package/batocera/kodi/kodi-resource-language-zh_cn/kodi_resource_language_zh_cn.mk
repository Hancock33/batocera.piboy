################################################################################
#
# kodi_resource_language_zh_cn
#
################################################################################
# Version: Commits on Nov 14, 2026
KODI_RESOURCE_LANGUAGE_ZH_CN_VERSION = 11.0.105
KODI_RESOURCE_LANGUAGE_ZH_CN_SOURCE = resource.language.zh_cn-$(KODI_RESOURCE_LANGUAGE_ZH_CN_VERSION).zip
KODI_RESOURCE_LANGUAGE_ZH_CN_SITE = https://mirrors.kodi.tv/addons/piers/resource.language.zh_cn
KODI_RESOURCE_LANGUAGE_ZH_CN_PLUGINNAME = resource.language.zh_cn

define KODI_RESOURCE_LANGUAGE_ZH_CN_EXTRACT_CMDS
	$(UNZIP) -q -o $(KODI_RESOURCE_LANGUAGE_ZH_CN_DL_DIR)/$(KODI_RESOURCE_LANGUAGE_ZH_CN_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_ZH_CN_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/kodi/addons/$(KODI_RESOURCE_LANGUAGE_ZH_CN_PLUGINNAME)
	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons
	cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_ZH_CN_PLUGINNAME) $(TARGET_DIR)/usr/share/kodi/addons/
endef

$(eval $(generic-package))
