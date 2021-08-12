################################################################################
#
# LIBRETRO_EASYRPG
#
################################################################################
# Version.: Commits on Aug 08, 2021
LIBRETRO_EASYRPG_VERSION = 538cf74e6d4adaae1d0d2bd3b855e7c4b272d95f
LIBRETRO_EASYRPG_DEPENDENCIES = sdl2 zlib fmt libpng freetype mpg123 libvorbis opusfile sdl2_mixer pixman speexdsp libxmp wildmidi liblcf
LIBRETRO_EASYRPG_LICENSE = MIT
LIBRETRO_EASYRPG_SITE = https://github.com/EasyRPG/Player.git
LIBRETRO_EASYRPG_GIT_SUBMODULES=YES
LIBRETRO_EASYRPG_SITE_METHOD=git

LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
LIBRETRO_EASYRPG_CONF_OPTS += -DPLAYER_BUILD_LIBLCF=OFF
LIBRETRO_EASYRPG_CONF_OPTS += -DPLAYER_TARGET_PLATFORM=libretro

LIBRETRO_EASYRPG_CONF_ENV += LDFLAGS="-lpthread -fPIC" CFLAGS="-fPIC" CXX_FLAGS="-fPIC"

# Should be set when the package cannot be built inside the source tree but needs a separate build directory.
LIBRETRO_EASYRPG_SUPPORTS_IN_SOURCE_BUILD = NO

define LIBRETRO_EASYRPG_INSTALL_TARGET_CMDS
        $(INSTALL) -D $(@D)/buildroot-build/easyrpg_libretro.so \
                $(TARGET_DIR)/usr/lib/libretro/easyrpg_libretro.so
endef

$(eval $(cmake-package))
