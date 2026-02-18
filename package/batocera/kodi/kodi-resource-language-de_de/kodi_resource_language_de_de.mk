################################################################################
#
# kodi_resource_language_de_de
#
################################################################################
# Version: Commits on Feb 14, 2026
KODI_RESOURCE_LANGUAGE_DE_DE_VERSION = 11.0.102
KODI_RESOURCE_LANGUAGE_DE_DE_SOURCE = resource.language.de_de-$(KODI_RESOURCE_LANGUAGE_DE_DE_VERSION).zip
KODI_RESOURCE_LANGUAGE_DE_DE_SITE = http://mirrors.kodi.tv/addons/piers/resource.language.de_de
KODI_RESOURCE_LANGUAGE_DE_DE_PLUGINNAME=resource.language.de_de

KODI_RESOURCE_LANGUAGE_DE_DE_CP_DIR=$(TARGET_DIR)/usr/share/kodi/addons

define KODI_RESOURCE_LANGUAGE_DE_DE_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(KODI_RESOURCE_LANGUAGE_DE_DE_DL_SUBDIR)/$(KODI_RESOURCE_LANGUAGE_DE_DE_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_DE_DE_INSTALL_TARGET_CMDS
	@mkdir -p $(KODI_RESOURCE_LANGUAGE_DE_DE_CP_DIR)
	@cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_DE_DE_PLUGINNAME) $(KODI_RESOURCE_LANGUAGE_DE_DE_CP_DIR)
endef

$(eval $(generic-package))
