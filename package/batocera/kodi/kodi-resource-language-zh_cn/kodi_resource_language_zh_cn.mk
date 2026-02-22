################################################################################
#
# kodi_resource_language_zh_cn
#
################################################################################
# Version: Commits on Feb 14, 2026
KODI_RESOURCE_LANGUAGE_ZH_CN_VERSION = 11.0.94
KODI_RESOURCE_LANGUAGE_ZH_CN_SOURCE = resource.language.zh_cn-$(KODI_RESOURCE_LANGUAGE_ZH_CN_VERSION).zip
KODI_RESOURCE_LANGUAGE_ZH_CN_SITE = http://mirrors.kodi.tv/addons/piers/resource.language.zh_cn
KODI_RESOURCE_LANGUAGE_ZH_CN_PLUGINNAME=resource.language.zh_cn

KODI_RESOURCE_LANGUAGE_ZH_CN_CP_DIR=$(TARGET_DIR)/usr/share/kodi/addons

define KODI_RESOURCE_LANGUAGE_ZH_CN_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(KODI_RESOURCE_LANGUAGE_ZH_CN_DL_SUBDIR)/$(KODI_RESOURCE_LANGUAGE_ZH_CN_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_ZH_CN_INSTALL_TARGET_CMDS
	@mkdir -p $(KODI_RESOURCE_LANGUAGE_ZH_CN_CP_DIR)
	@cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_ZH_CN_PLUGINNAME) $(KODI_RESOURCE_LANGUAGE_ZH_CN_CP_DIR)
endef

$(eval $(generic-package))
