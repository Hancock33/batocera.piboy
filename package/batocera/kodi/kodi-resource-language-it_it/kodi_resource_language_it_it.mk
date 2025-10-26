################################################################################
#
# kodi_resource_language_it_it
#
################################################################################
# Version: Commits on Oct 18, 2025
KODI_RESOURCE_LANGUAGE_IT_IT_VERSION = 11.0.98
KODI_RESOURCE_LANGUAGE_IT_IT_SOURCE = resource.language.it_it-$(KODI_RESOURCE_LANGUAGE_IT_IT_VERSION).zip
KODI_RESOURCE_LANGUAGE_IT_IT_SITE = http://mirrors.kodi.tv/addons/piers/resource.language.it_it
KODI_RESOURCE_LANGUAGE_IT_IT_PLUGINNAME=resource.language.it_it

KODI_RESOURCE_LANGUAGE_IT_IT_CP_DIR=$(TARGET_DIR)/usr/share/kodi/addons

define KODI_RESOURCE_LANGUAGE_IT_IT_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(KODI_RESOURCE_LANGUAGE_IT_IT_DL_SUBDIR)/$(KODI_RESOURCE_LANGUAGE_IT_IT_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_IT_IT_INSTALL_TARGET_CMDS
	@mkdir -p $(KODI_RESOURCE_LANGUAGE_IT_IT_CP_DIR)
	@cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_IT_IT_PLUGINNAME) $(KODI_RESOURCE_LANGUAGE_IT_IT_CP_DIR)
endef

$(eval $(generic-package))
