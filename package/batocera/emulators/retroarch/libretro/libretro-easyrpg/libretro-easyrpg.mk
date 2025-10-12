################################################################################
#
# libretro-easyrpg
#
################################################################################
# Version: Commits on Oct 12, 2025
LIBRETRO_EASYRPG_VERSION = 31de2a75e2187360bc55b1b43f9524779485fe8a
LIBRETRO_EASYRPG_SITE = https://github.com/EasyRPG/Player.git
LIBRETRO_EASYRPG_GIT_SUBMODULES=YES
LIBRETRO_EASYRPG_SITE_METHOD=git
LIBRETRO_EASYRPG_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_EASYRPG_LICENSE = GPLv3

LIBRETRO_EASYRPG_DEPENDENCIES = fluidsynth fmt freetype liblcf libpng libvorbis libxmp mpg123
LIBRETRO_EASYRPG_DEPENDENCIES += opusfile pixman retroarch sdl2 speexdsp wildmidi zlib

LIBRETRO_EASYRPG_CONF_OPTS += -DPLAYER_TARGET_PLATFORM=libretro
LIBRETRO_EASYRPG_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
LIBRETRO_EASYRPG_CONF_ENV += LDFLAGS="-lpthread -fPIC" CFLAGS="-fPIC" CXX_FLAGS="-fPIC"

define LIBRETRO_EASYRPG_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/easyrpg_libretro.so $(TARGET_DIR)/usr/lib/libretro/easyrpg_libretro.so
endef

$(eval $(cmake-package))
