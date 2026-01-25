################################################################################
#
# omf2097
#
################################################################################
# Version: Commits on Jan 24, 2026
OMF2097_VERSION = 70782d3e53e4e5232120a4df748d8c16628de649
OMF2097_SITE = $(call github,omf2097,openomf,$(OMF2097_VERSION))
OMF2097_DEPENDENCIES = enet host-omf2097 libconfuse libminiupnpc sdl2 sdl2_mixer
OMF2097_LICENSE = MIT
OMF2097_SUPPORTS_IN_SOURCE_BUILD = NO

OMF2097_CONF_OPTS += -DUSE_NATPMP=OFF -DUSE_MINIUPNPC=OFF
OMF2097_CONF_OPTS += -DOMF_COMMAND_WRAPPER=$(BUILD_DIR)/host-omf2097-$(OMF2097_VERSION)/buildroot-build/languagetool
HOST_OMF2097_CONF_OPTS += -DUSE_TOOLS=ON -DUSE_NATPMP=OFF -DUSE_MINIUPNPC=OFF

define OMF2097_POST_PROCESS
	rm -rf $(TARGET_DIR)/usr/share/game_assets/omf2097
	mkdir -p $(TARGET_DIR)/usr/share/game_assets
	ln -sf /usr/share/games/openomf $(TARGET_DIR)/usr/share/game_assets/omf2097
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/omf2097/omf2097.keys $(TARGET_DIR)/usr/share/evmapy
endef

OMF2097_POST_INSTALL_TARGET_HOOKS += OMF2097_POST_PROCESS

$(eval $(cmake-package))
$(eval $(host-cmake-package))
