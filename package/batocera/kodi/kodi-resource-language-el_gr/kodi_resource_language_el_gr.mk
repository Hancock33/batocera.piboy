################################################################################
#
# kodi_resource_language_el_gr
#
################################################################################
# Version: Commits on Jun 11, 2024
KODI_RESOURCE_LANGUAGE_EL_GR_VERSION = 11.0.62
KODI_RESOURCE_LANGUAGE_EL_GR_SOURCE = resource.language.el_gr-$(KODI_RESOURCE_LANGUAGE_EL_GR_VERSION).zip
KODI_RESOURCE_LANGUAGE_EL_GR_SITE = http://mirrors.kodi.tv/addons/omega/resource.language.el_gr
KODI_RESOURCE_LANGUAGE_EL_GR_PLUGINNAME=resource.language.el_gr

KODI_PLUGIN_TARGET_DIR=$(TARGET_DIR)/usr/share/kodi/addons

define KODI_RESOURCE_LANGUAGE_EL_GR_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(KODI_RESOURCE_LANGUAGE_EL_GR_DL_SUBDIR)/$(KODI_RESOURCE_LANGUAGE_EL_GR_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_EL_GR_INSTALL_TARGET_CMDS
	@mkdir -p $(KODI_PLUGIN_TARGET_DIR)
	@cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_EL_GR_PLUGINNAME) $(KODI_PLUGIN_TARGET_DIR)
endef

$(eval $(generic-package))
