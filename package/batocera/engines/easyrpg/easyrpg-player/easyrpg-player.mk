################################################################################
#
# easyrpg-player
#
################################################################################
# Version: Commits on Jan 27, 2026
EASYRPG_PLAYER_VERSION = df4e1eedfdcb5634a2fab0f6ea5138c5de19cc6c
EASYRPG_PLAYER_SITE = $(call github,EasyRPG,Player,$(EASYRPG_PLAYER_VERSION))
EASYRPG_PLAYER_LICENSE = MIT
EASYRPG_PLAYER_SUPPORTS_IN_SOURCE_BUILD = NO
EASYRPG_PLAYER_EMULATOR_INFO = easyrpg.emulator.yml

EASYRPG_PLAYER_DEPENDENCIES += sdl2 zlib fmt libpng freetype mpg123 libvorbis
EASYRPG_PLAYER_DEPENDENCIES += opusfile liblcf pixman speexdsp libxmp wildmidi fluidsynth

EASYRPG_PLAYER_CONF_OPTS += -DPLAYER_BUILD_EXECUTABLE=ON
EASYRPG_PLAYER_CONF_ENV += LDFLAGS=-lpthread

define EASYRPG_PLAYER_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/engines/easyrpg/easyrpg-player/easyrpg.easyrpg.keys $(TARGET_DIR)/usr/share/evmapy
endef

EASYRPG_PLAYER_POST_INSTALL_TARGET_HOOKS += EASYRPG_PLAYER_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
