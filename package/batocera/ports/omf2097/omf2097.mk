################################################################################
#
# omf2097
#
################################################################################
# Version: Commits on Apr 23, 2025
OMF2097_VERSION = 91ec43b1a949a883da83ddeffaa2d54a94fb5fa7
OMF2097_SITE = $(call github,omf2097,openomf,$(OMF2097_VERSION))
OMF2097_DEPENDENCIES = sdl2 sdl2_mixer libargtable2 enet libconfuse libminiupnpc
OMF2097_LICENSE = MIT
OMF2097_SUPPORTS_IN_SOURCE_BUILD = NO

ifeq ($(BR2_arm)$(BR2_aarch64),y)
    OMF2097_DEPENDENCIES += host-omf2097
    OMF2097_CONF_OPTS += -DOMF_COMMAND_WRAPPER=$(BUILD_DIR)/host-omf2097-$(OMF2097_VERSION)/buildroot-build/languagetool
    HOST_OMF2097_CONF_OPTS += -DUSE_TOOLS=ON -DUSE_NATPMP=OFF -DUSE_MINIUPNPC=OFF
endif

OMF2097_CONF_OPTS += -DUSE_NATPMP=OFF -DUSE_MINIUPNPC=OFF

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
