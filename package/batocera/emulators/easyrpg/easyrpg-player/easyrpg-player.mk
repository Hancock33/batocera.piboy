################################################################################
#
# easyrpg-player
#
################################################################################
# Version: Commits on Apr 20, 2024
EASYRPG_PLAYER_VERSION = b313163f57a5eb76fb38269e79ca77113cd1288a
EASYRPG_PLAYER_SITE = $(call github,EasyRPG,Player,$(EASYRPG_PLAYER_VERSION))
EASYRPG_PLAYER_LICENSE = MIT
EASYRPG_PLAYER_SUPPORTS_IN_SOURCE_BUILD = NO

EASYRPG_PLAYER_DEPENDENCIES += sdl2 zlib fmt libpng freetype mpg123 libvorbis
EASYRPG_PLAYER_DEPENDENCIES += opusfile liblcf pixman speexdsp libxmp wildmidi fluidsynth

EASYRPG_PLAYER_CONF_OPTS += -DPLAYER_BUILD_EXECUTABLE=ON
EASYRPG_PLAYER_CONF_ENV += LDFLAGS=-lpthread

# Should be set when the package cannot be built inside the source tree but needs a separate build directory.
EASYRPG_PLAYER_SUPPORTS_IN_SOURCE_BUILD = NO

define EASYRPG_PLAYER_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/easyrpg/easyrpg-player/easyrpg.easyrpg.keys $(TARGET_DIR)/usr/share/evmapy
endef

EASYRPG_PLAYER_POST_INSTALL_TARGET_HOOKS += EASYRPG_PLAYER_EVMAPY

$(eval $(cmake-package))
