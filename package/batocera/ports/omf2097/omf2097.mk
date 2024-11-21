################################################################################
#
# omf2097
#
################################################################################
# Version: Commits on Nov 20, 2024
OMF2097_VERSION = b45723e56dcbd89cce877425703ace8822f78d02
OMF2097_SITE = $(call github,omf2097,openomf,$(OMF2097_VERSION))
OMF2097_DEPENDENCIES = sdl2 sdl2_mixer libargtable2 enet libconfuse
OMF2097_LICENSE = MIT
OMF2097_SUPPORTS_IN_SOURCE_BUILD = NO

define OMF2097_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/openomf  $(TARGET_DIR)/usr/bin/openomf
	rm -rf $(TARGET_DIR)/usr/share/game_assets/omf2097
	rm -rf $(TARGET_DIR)/usr/share/games/openomf
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/omf2097
	mkdir -p $(TARGET_DIR)/usr/share/games/openomf
	cp  $(@D)/buildroot-build/resources/openomf.bk $(TARGET_DIR)/usr/share/game_assets/omf2097
	cp -avr $(@D)/buildroot-build/shaders $(TARGET_DIR)/usr/share/games/openomf
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/omf2097/omf2097.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
