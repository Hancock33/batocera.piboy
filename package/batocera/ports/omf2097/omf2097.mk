################################################################################
#
# omf2097
#
################################################################################
# Version: Commits on Jul 29, 2024
OMF2097_VERSION = 9807e6ff76b29ac6cebe34b53d4ff3c34ef05efc
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
