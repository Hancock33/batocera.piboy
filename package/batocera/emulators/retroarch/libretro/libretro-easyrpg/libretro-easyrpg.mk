################################################################################
#
# libretro-easyrpg
#
################################################################################
# Version: Commits on Feb 07, 2026
LIBRETRO_EASYRPG_VERSION = 21c8985152ff0d8e3e6cbc7c0d0f930c81838109
LIBRETRO_EASYRPG_SITE = https://github.com/EasyRPG/Player.git
LIBRETRO_EASYRPG_GIT_SUBMODULES=YES
LIBRETRO_EASYRPG_SITE_METHOD=git
LIBRETRO_EASYRPG_LICENSE = GPLv3
LIBRETRO_EASYRPG_EMULATOR_INFO = easyrpg.libretro.core.yml
LIBRETRO_EASYRPG_SUPPORTS_IN_SOURCE_BUILD = NO

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
$(eval $(emulator-info-package))
