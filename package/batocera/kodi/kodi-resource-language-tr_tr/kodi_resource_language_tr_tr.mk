################################################################################
#
# kodi_resource_language_tr_tr
#
################################################################################
# Version: Commits on Jan 03, 2026
KODI_RESOURCE_LANGUAGE_TR_TR_VERSION = 11.0.88
KODI_RESOURCE_LANGUAGE_TR_TR_SOURCE = resource.language.tr_tr-$(KODI_RESOURCE_LANGUAGE_TR_TR_VERSION).zip
KODI_RESOURCE_LANGUAGE_TR_TR_SITE = http://mirrors.kodi.tv/addons/piers/resource.language.tr_tr
KODI_RESOURCE_LANGUAGE_TR_TR_PLUGINNAME=resource.language.tr_tr

KODI_RESOURCE_LANGUAGE_TR_TR_CP_DIR=$(TARGET_DIR)/usr/share/kodi/addons

define KODI_RESOURCE_LANGUAGE_TR_TR_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(KODI_RESOURCE_LANGUAGE_TR_TR_DL_SUBDIR)/$(KODI_RESOURCE_LANGUAGE_TR_TR_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_TR_TR_INSTALL_TARGET_CMDS
	@mkdir -p $(KODI_RESOURCE_LANGUAGE_TR_TR_CP_DIR)
	@cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_TR_TR_PLUGINNAME) $(KODI_RESOURCE_LANGUAGE_TR_TR_CP_DIR)
endef

$(eval $(generic-package))
