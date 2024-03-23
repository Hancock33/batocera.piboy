################################################################################
#
# libretro-tic80
#
################################################################################
# Version: Commits on Mar 06, 2024
LIBRETRO_TIC80_VERSION = 6e849134404cc1476a432eb55d84d436f0b74c32
LIBRETRO_TIC80_SITE = https://github.com/nesbox/TIC-80.git
LIBRETRO_TIC80_SITE_METHOD=git
LIBRETRO_TIC80_GIT_SUBMODULES=YES
LIBRETRO_TIC80_LICENSE = MIT
LIBRETRO_TIC80_DEPENDENCIES = janet

ifeq ($(BR2_PACKAGE_BATOCERA_RPI_ANY),y)
LIBRETRO_TIC80_CONF_OPTS = -DRPI=ON
endif

LIBRETRO_TIC80_CONF_OPTS += -DBUILD_DEMO_CARTS=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_LIBRETRO=ON
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_PLAYER=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_SDL=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_SOKOL=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_WITH_MRUBY=OFF

define LIBRETRO_TIC80_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/lib/tic80_libretro.so $(TARGET_DIR)/usr/lib/libretro/tic80_libretro.so
endef

$(eval $(cmake-package))
