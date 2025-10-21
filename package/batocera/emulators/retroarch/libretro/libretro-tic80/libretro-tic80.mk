################################################################################
#
# libretro-tic80
#
################################################################################
# Version: Commits on Oct 21, 2025
LIBRETRO_TIC80_VERSION = a2c875f7275541e7724199ce8e504fb578b819a6
LIBRETRO_TIC80_SITE = https://github.com/nesbox/TIC-80.git
LIBRETRO_TIC80_SITE_METHOD=git
LIBRETRO_TIC80_GIT_SUBMODULES=YES
LIBRETRO_TIC80_LICENSE = MIT
LIBRETRO_TIC80_DEPENDENCIES = janet retroarch

LIBRETRO_TIC80_CONF_OPTS += -DBUILD_LIBRETRO=ON
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_SDL=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_STATIC=ON

define LIBRETRO_TIC80_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/bin/tic80_libretro.so $(TARGET_DIR)/usr/lib/libretro/tic80_libretro.so
endef

$(eval $(cmake-package))
