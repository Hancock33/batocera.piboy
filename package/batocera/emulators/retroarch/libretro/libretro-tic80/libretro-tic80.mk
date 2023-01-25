################################################################################
#
# libretro-tic80
#
################################################################################
# Version: Commits on Jan 14, 2023
LIBRETRO_TIC80_VERSION = ca3bb11f7d91b6f61c30b27e95958521e3432576
LIBRETRO_TIC80_SITE = https://github.com/nesbox/TIC-80.git
LIBRETRO_TIC80_SITE_METHOD=git
LIBRETRO_TIC80_GIT_SUBMODULES=YES
LIBRETRO_TIC80_LICENSE = MIT

LIBRETRO_TIC80_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_RPI_ANY),y)
LIBRETRO_TIC80_CONF_OPTS = -DRPI=ON
endif

LIBRETRO_TIC80_CONF_OPTS += -DBUILD_PLAYER=OFF -DBUILD_SOKOL=OFF -DBUILD_SDL=OFF -DBUILD_DEMO_CARTS=OFF -DBUILD_LIBRETRO=ON -DBUILD_WITH_MRUBY=OFF

define LIBRETRO_TIC80_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_TIC80_PLATFORM)"
endef

define LIBRETRO_TIC80_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/lib/tic80_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/tic80_libretro.so
endef

$(eval $(cmake-package))
