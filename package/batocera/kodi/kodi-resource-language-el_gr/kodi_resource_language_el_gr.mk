################################################################################
#
# kodi_resource_language_el_gr
#
################################################################################
# Version: Commits on Nov 14, 2026
KODI_RESOURCE_LANGUAGE_EL_GR_VERSION = 11.0.85
KODI_RESOURCE_LANGUAGE_EL_GR_SOURCE = resource.language.el_gr-$(KODI_RESOURCE_LANGUAGE_EL_GR_VERSION).zip
KODI_RESOURCE_LANGUAGE_EL_GR_SITE = https://mirrors.kodi.tv/addons/piers/resource.language.el_gr
KODI_RESOURCE_LANGUAGE_EL_GR_PLUGINNAME = resource.language.el_gr

define KODI_RESOURCE_LANGUAGE_EL_GR_EXTRACT_CMDS
	$(UNZIP) -q -o $(KODI_RESOURCE_LANGUAGE_EL_GR_DL_DIR)/$(KODI_RESOURCE_LANGUAGE_EL_GR_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_EL_GR_INSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/usr/share/kodi/addons/$(KODI_RESOURCE_LANGUAGE_EL_GR_PLUGINNAME)
	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons
	cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_EL_GR_PLUGINNAME) $(TARGET_DIR)/usr/share/kodi/addons/
endef

$(eval $(generic-package))
