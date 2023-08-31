################################################################################
#
# kodi_resource_language_pt_br
#
################################################################################

KODI_RESOURCE_LANGUAGE_PT_BR_VERSION = 10.0.70
KODI_RESOURCE_LANGUAGE_PT_BR_SOURCE = resource.language.pt_br-$(KODI_RESOURCE_LANGUAGE_PT_BR_VERSION).zip
KODI_RESOURCE_LANGUAGE_PT_BR_SITE = http://mirrors.kodi.tv/addons/nexus/resource.language.pt_br
KODI_RESOURCE_LANGUAGE_PT_BR_PLUGINNAME=resource.language.pt_br

KODI_PLUGIN_TARGET_DIR=$(TARGET_DIR)/usr/share/kodi/addons

define KODI_RESOURCE_LANGUAGE_PT_BR_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(KODI_RESOURCE_LANGUAGE_PT_BR_DL_SUBDIR)/$(KODI_RESOURCE_LANGUAGE_PT_BR_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_PT_BR_INSTALL_TARGET_CMDS
	@mkdir -p $(KODI_PLUGIN_TARGET_DIR)
	@cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_PT_BR_PLUGINNAME) $(KODI_PLUGIN_TARGET_DIR)
endef

$(eval $(generic-package))
