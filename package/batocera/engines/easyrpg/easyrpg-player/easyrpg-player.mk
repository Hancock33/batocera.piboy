################################################################################
#
# easyrpg-player
#
################################################################################
# Version: Commits on Nov 22, 2026
EASYRPG_PLAYER_VERSION = a99ca834b8560f6a39a4df5de2d3972523ba2f30
EASYRPG_PLAYER_SITE = $(call github,EasyRPG,Player,$(EASYRPG_PLAYER_VERSION))
EASYRPG_PLAYER_LICENSE = MIT
EASYRPG_PLAYER_SUPPORTS_IN_SOURCE_BUILD = NO
EASYRPG_PLAYER_EMULATOR_INFO = easyrpg.emulator.yml

EASYRPG_PLAYER_DEPENDENCIES += sdl2 zlib fmt libpng freetype mpg123 libvorbis
EASYRPG_PLAYER_DEPENDENCIES += opusfile liblcf pixman speexdsp libxmp wildmidi fluidsynth

EASYRPG_PLAYER_CONF_OPTS += -DPLAYER_BUILD_EXECUTABLE=ON

define EASYRPG_PLAYER_EVMAPY
	$(INSTALL) -D -m 0644 $(EASYRPG_PLAYER_PKGDIR)/easyrpg.easyrpg.keys $(TARGET_DIR)/usr/share/evmapy/easyrpg.easyrpg.keys
endef

EASYRPG_PLAYER_POST_INSTALL_TARGET_HOOKS += EASYRPG_PLAYER_EVMAPY

$(eval $(cmake-package))
$(eval $(emulator-info-package))
