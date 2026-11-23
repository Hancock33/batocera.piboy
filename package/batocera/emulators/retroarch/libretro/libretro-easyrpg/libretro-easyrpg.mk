################################################################################
#
# libretro-easyrpg
#
################################################################################
# Version: Commits on Nov 22, 2026
LIBRETRO_EASYRPG_VERSION = a99ca834b8560f6a39a4df5de2d3972523ba2f30
LIBRETRO_EASYRPG_SITE = https://github.com/EasyRPG/Player.git
LIBRETRO_EASYRPG_GIT_SUBMODULES=YES
LIBRETRO_EASYRPG_SITE_METHOD=git
LIBRETRO_EASYRPG_LICENSE = GPL-3.0
LIBRETRO_EASYRPG_EMULATOR_INFO = easyrpg.libretro.core.yml
LIBRETRO_EASYRPG_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_EASYRPG_DEPENDENCIES = fluidsynth fmt freetype harfbuzz json-for-modern-cpp liblcf libpng
LIBRETRO_EASYRPG_DEPENDENCIES += libvorbis libxmp mpg123 opusfile pixman retroarch speexdsp wildmidi zlib

LIBRETRO_EASYRPG_CONF_OPTS += -DPLAYER_TARGET_PLATFORM=libretro
LIBRETRO_EASYRPG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
LIBRETRO_EASYRPG_CONF_OPTS += -DPLAYER_WITH_FLUIDLITE=OFF
LIBRETRO_EASYRPG_CONF_OPTS += -DPLAYER_WITH_LHASA=OFF
LIBRETRO_EASYRPG_CONF_OPTS += -DPLAYER_WITH_LIBSNDFILE=OFF
LIBRETRO_EASYRPG_CONF_OPTS += -DPLAYER_WITH_SAMPLERATE=OFF

define LIBRETRO_EASYRPG_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/easyrpg_libretro.so $(TARGET_DIR)/usr/lib/libretro/easyrpg_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
