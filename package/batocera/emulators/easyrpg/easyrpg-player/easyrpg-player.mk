################################################################################
#
# easyrpg-player
#
################################################################################
# Version: Commits on Jan 04, 2025
EASYRPG_PLAYER_VERSION = 4ab1f8754e99e2ac31f2953c5e9a9b56b712bdd0
EASYRPG_PLAYER_SITE = $(call github,EasyRPG,Player,$(EASYRPG_PLAYER_VERSION))
EASYRPG_PLAYER_LICENSE = MIT
EASYRPG_PLAYER_SUPPORTS_IN_SOURCE_BUILD = NO

EASYRPG_PLAYER_DEPENDENCIES += sdl2 zlib fmt libpng freetype mpg123 libvorbis
EASYRPG_PLAYER_DEPENDENCIES += opusfile liblcf pixman speexdsp libxmp wildmidi fluidsynth

EASYRPG_PLAYER_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
EASYRPG_PLAYER_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
EASYRPG_PLAYER_CONF_OPTS += -DPLAYER_BUILD_EXECUTABLE=ON
EASYRPG_PLAYER_CONF_ENV += LDFLAGS=-lpthread

define EASYRPG_PLAYER_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/easyrpg/easyrpg-player/easyrpg.easyrpg.keys $(TARGET_DIR)/usr/share/evmapy
endef

EASYRPG_PLAYER_POST_INSTALL_TARGET_HOOKS += EASYRPG_PLAYER_EVMAPY

$(eval $(cmake-package))
