################################################################################
#
# omf2097
#
################################################################################
# Version: Commits on Jun 30, 2024
OMF2097_VERSION = 45cad2cd697b9e7343919ee01c3bcebfc886a77f
OMF2097_SITE = $(call github,omf2097,openomf,$(OMF2097_VERSION))
OMF2097_DEPENDENCIES = sdl2 sdl2_mixer libargtable2 enet libconfuse
OMF2097_LICENSE = MIT
OMF2097_SUPPORTS_IN_SOURCE_BUILD = NO

define OMF2097_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/openomf  $(TARGET_DIR)/usr/bin/openomf
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/omf2097
	cp  $(@D)/resources/openomf.bk $(TARGET_DIR)/usr/share/game_assets/omf2097
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/omf2097/omf2097.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
