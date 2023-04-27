################################################################################
#
# libretro-easyrpg
#
################################################################################
# Version: Commits on Apr 26, 2023
LIBRETRO_EASYRPG_VERSION = ad2516dcd4bf4458e653b1278b638722cd3c6cc1
LIBRETRO_EASYRPG_SITE = https://github.com/EasyRPG/Player.git
LIBRETRO_EASYRPG_GIT_SUBMODULES=YES
LIBRETRO_EASYRPG_SITE_METHOD=git
LIBRETRO_EASYRPG_LICENSE = GPLv3
LIBRETRO_EASYRPG_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_EASYRPG_DEPENDENCIES = sdl2 zlib fmt libpng freetype mpg123 libvorbis \
    opusfile pixman speexdsp libxmp wildmidi liblcf fluidsynth host-ninja

LIBRETRO_EASYRPG_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -GNinja \
    -DPLAYER_TARGET_PLATFORM=libretro -DBUILD_SHARED_LIBS=ON
LIBRETRO_EASYRPG_CONF_ENV += LDFLAGS="-lpthread -fPIC" CFLAGS="-fPIC" CXX_FLAGS="-fPIC"

define LIBRETRO_EASYRPG_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(LIBRETRO_EASYRPG_BUILDDIR)
endef

define LIBRETRO_EASYRPG_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/buildroot-build/easyrpg_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/easyrpg_libretro.so
endef

$(eval $(cmake-package))
