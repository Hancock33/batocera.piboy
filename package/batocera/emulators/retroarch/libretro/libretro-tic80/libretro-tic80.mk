################################################################################
#
# libretro-tic80
#
################################################################################
# Version: Commits on Nov 21, 2026
LIBRETRO_TIC80_VERSION = 9dcd4b545f4032ee76729c223af285cb2ca3ff92
LIBRETRO_TIC80_SITE = https://github.com/nesbox/TIC-80.git
LIBRETRO_TIC80_SITE_METHOD=git
LIBRETRO_TIC80_GIT_SUBMODULES=YES
LIBRETRO_TIC80_LICENSE = MIT
LIBRETRO_TIC80_DEPENDENCIES = retroarch
LIBRETRO_TIC80_EMULATOR_INFO = tic80.libretro.core.yml

LIBRETRO_TIC80_CONF_OPTS += -DBUILD_LIBRETRO=ON
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_SDL=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_SOKOL=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_STATIC=ON

define LIBRETRO_TIC80_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/bin/tic80_libretro.so $(TARGET_DIR)/usr/lib/libretro/tic80_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
