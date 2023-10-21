################################################################################
#
# libretro-easyrpg
#
################################################################################
# Version: Commits on Oct 21, 2023
LIBRETRO_EASYRPG_VERSION = c8576e0678ea69c12acf1ba13a308e2598492ad3
LIBRETRO_EASYRPG_SITE = https://github.com/EasyRPG/Player.git
LIBRETRO_EASYRPG_GIT_SUBMODULES=YES
LIBRETRO_EASYRPG_SITE_METHOD=git
LIBRETRO_EASYRPG_LICENSE = GPLv3
LIBRETRO_EASYRPG_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_EASYRPG_DEPENDENCIES = sdl2 zlib fmt libpng freetype mpg123 libvorbis \
	opusfile pixman speexdsp libxmp wildmidi liblcf fluidsynth

LIBRETRO_EASYRPG_CONF_OPTS += -DPLAYER_TARGET_PLATFORM=libretro
LIBRETRO_EASYRPG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
LIBRETRO_EASYRPG_CONF_ENV += LDFLAGS="-lpthread -fPIC" CFLAGS="-fPIC" CXX_FLAGS="-fPIC"

define LIBRETRO_EASYRPG_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/easyrpg_libretro.so \
	$(TARGET_DIR)/usr/lib/libretro/easyrpg_libretro.so
endef

$(eval $(cmake-package))
