################################################################################
#
# kodi_resource_language_sv_se
#
################################################################################
# Version: Commits on Jun 11, 2024
KODI_RESOURCE_LANGUAGE_SV_SE_VERSION = 11.0.76
KODI_RESOURCE_LANGUAGE_SV_SE_SOURCE = resource.language.sv_se-$(KODI_RESOURCE_LANGUAGE_SV_SE_VERSION).zip
KODI_RESOURCE_LANGUAGE_SV_SE_SITE = http://mirrors.kodi.tv/addons/omega/resource.language.sv_se
KODI_RESOURCE_LANGUAGE_SV_SE_PLUGINNAME=resource.language.sv_se

KODI_RESOURCE_LANGUAGE_SV_SE_DIR=$(TARGET_DIR)/usr/share/kodi/addons

define KODI_RESOURCE_LANGUAGE_SV_SE_EXTRACT_CMDS
	@unzip -q -o $(DL_DIR)/$(KODI_RESOURCE_LANGUAGE_SV_SE_DL_SUBDIR)/$(KODI_RESOURCE_LANGUAGE_SV_SE_SOURCE) -d $(@D)
endef

define KODI_RESOURCE_LANGUAGE_SV_SE_INSTALL_TARGET_CMDS
	@mkdir -p $(KODI_RESOURCE_LANGUAGE_SV_SE_DIR)
	@cp -r $(@D)/$(KODI_RESOURCE_LANGUAGE_SV_SE_PLUGINNAME) $(KODI_RESOURCE_LANGUAGE_SV_SE_DIR)
endef

$(eval $(generic-package))
