################################################################################
#
# omf2097
#
################################################################################
# Version: Commits on Apr 12, 2026
OMF2097_VERSION = 450d27155ae9eef2486202461c09c27a66aca901
OMF2097_SITE = $(call github,omf2097,openomf,$(OMF2097_VERSION))
OMF2097_EMULATOR_INFO = omf2097.emulator.yml
OMF2097_DEPENDENCIES = enet host-omf2097 libconfuse libminiupnpc sdl2 sdl2_mixer
OMF2097_LICENSE = MIT
OMF2097_SUPPORTS_IN_SOURCE_BUILD = NO

OMF2097_CONF_OPTS += -DUSE_NATPMP=OFF -DUSE_MINIUPNPC=OFF
OMF2097_CONF_OPTS += -DOMF_COMMAND_WRAPPER=$(BUILD_DIR)/host-omf2097-$(OMF2097_VERSION)/buildroot-build/languagetool
HOST_OMF2097_CONF_OPTS += -DUSE_TOOLS=ON -DUSE_NATPMP=OFF -DUSE_MINIUPNPC=OFF

define OMF2097_POST_PROCESS
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/omf2097/omf2097.keys $(TARGET_DIR)/usr/share/evmapy
endef

OMF2097_POST_INSTALL_TARGET_HOOKS += OMF2097_POST_PROCESS

$(eval $(cmake-package))
$(eval $(emulator-info-package))
$(eval $(host-cmake-package))
