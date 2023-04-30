################################################################################
#
# omf2097
#
################################################################################
# Version: Commits on Apr 30, 2023
OMF2097_VERSION = 338584c138882bb80714377de6aa58749b8864ce
OMF2097_SITE = $(call github,omf2097,openomf,$(OMF2097_VERSION))

OMF2097_DEPENDENCIES = sdl2 sdl2_mixer libargtable2 enet libconfuse host-ninja
OMF2097_LICENSE = MIT

OMF2097_SUPPORTS_IN_SOURCE_BUILD = NO

OMF2097_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja

define OMF2097_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(OMF2097_BUILDDIR)
endef

define OMF2097_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/openomf  $(TARGET_DIR)/usr/bin/openomf
	mkdir -p $(TARGET_DIR)/usr/share/game_assets/omf2097
    cp  $(@D)/resources/openomf.bk $(TARGET_DIR)/usr/share/game_assets/omf2097
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/omf2097/omf2097.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
