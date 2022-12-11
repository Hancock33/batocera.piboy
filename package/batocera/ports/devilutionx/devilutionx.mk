################################################################################
#
# devilutionx
#
################################################################################
# Version: Commits on Jul 25, 2022
DEVILUTIONX_VERSION = 1.4.1
DEVILUTIONX_SITE = https://github.com/diasurgical/devilutionX/releases/download/$(DEVILUTIONX_VERSION)
DEVILUTIONX_SOURCE = devilutionx-src.tar.xz
DEVILUTIONX_DEPENDENCIES = sdl2 sdl2_image fmt libsodium libpng bzip2
DEVILUTIONX_SUPPORTS_IN_SOURCE_BUILD = NO

# Prefill the player name when creating a new character, in case the device does
# not have a keyboard.
DEVILUTIONX_CONF_OPTS += -DBUILD_TESTING=OFF -DPREFILL_PLAYER_NAME=ON \
                         -DNONET=ON -DCMAKE_BUILD_TYPE=Release

# Ensure that DevilutionX's vendored dependencies are not accidentally fetched from network.
# They should all be present in the source package.
DEVILUTIONX_CONF_OPTS += -DFETCHCONTENT_FULLY_DISCONNECTED=ON

define DEVILUTIONX_FIX_SDL2MAIN
	sed -i -e s+"SDL2::SDL2main"+"-lSDL2main"+ $(@D)/CMakeLists.txt
endef

DEVILUTIONX_PRE_CONFIGURE_HOOKS += DEVILUTIONX_FIX_SDL2MAIN

define DEVILUTIONX_INSTALL_TARGET_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/devilutionx/devilutionx.keys $(TARGET_DIR)/usr/share/evmapy
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/devilutionx
	$(INSTALL) -D $(@D)/dist/devilutionx.mpq $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/devilutionx
endef

DEVILUTIONX_POST_INSTALL_TARGET_HOOKS = DEVILUTIONX_INSTALL_TARGET_EVMAPY

# when rebuilding a new version will not be downloaded if an existing version is cached.
# delete existing version before building
define DEVILUTIONX_REMOVE_SOURCE
	rm -rf $(DL_DIR)/$(DEVILUTIONX_DL_SUBDIR)/$(DEVILUTIONX_SOURCE)
endef
DEVILUTIONX_PRE_DOWNLOAD_HOOKS += DEVILUTIONX_REMOVE_SOURCE

$(eval $(cmake-package))
