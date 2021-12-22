################################################################################
#
# One Must Fall 2097
#
################################################################################
# Version.: Commits on Dec 21, 2021
OMF2097_VERSION = eba4f449d4a0987912b4457d944b1e013344f46f
OMF2097_SITE = $(call github,omf2097,openomf,$(OMF2097_VERSION))

OMF2097_DEPENDENCIES = sdl2 sdl2_mixer libargtable2 enet libconfuse
OMF2097_LICENSE = MIT

OMF2097_SUPPORTS_IN_SOURCE_BUILD = NO

OMF2097_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

ifeq ($(BR2_PACKAGE_XPI_GAMECON_RPI3)$(BR2_PACKAGE_XPI_GAMECON_RPI4),y)
    OMF2097_POST_INSTALL_TARGET_HOOKS += OMF2097_INSTALL_BOOT_PIBOY
else
    OMF2097_POST_INSTALL_TARGET_HOOKS += OMF2097_INSTALL_BOOT_X86
endif

define OMF2097_INSTALL_BOOT_PIBOY
 	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/omf2097
    mv $(TARGET_DIR)/usr/share/games/openomf/openomf.bk $(TARGET_DIR)/usr/share/batocera/datainit/roms/omf2097
    rm -r $(TARGET_DIR)/usr/share/games/openomf
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/omf2097/omf2097.keys $(TARGET_DIR)/usr/share/evmapy
endef

define OMF2097_INSTALL_BOOT_X86
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/omf2097
    mv $(TARGET_DIR)/usr/share/games/openomf/openomf.bk $(TARGET_DIR)/usr/share/batocera/datainit/roms/omf2097
    rm -r $(TARGET_DIR)/usr/share/games/openomf
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/omf2097/omf2097.keys $(TARGET_DIR)/usr/share/evmapy
endef


$(eval $(cmake-package))
