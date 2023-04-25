################################################################################
#
# libretro-tic80
#
################################################################################
# Version: Commits on Apr 20, 2023
LIBRETRO_TIC80_VERSION = ffd6965baadff4b9300d7dac01ee9a6c4211dd97
LIBRETRO_TIC80_SITE = https://github.com/nesbox/TIC-80.git
LIBRETRO_TIC80_SITE_METHOD=git
LIBRETRO_TIC80_GIT_SUBMODULES=YES
LIBRETRO_TIC80_LICENSE = MIT

ifeq ($(BR2_PACKAGE_BATOCERA_RPI_ANY),y)
LIBRETRO_TIC80_CONF_OPTS = -DRPI=ON
endif

LIBRETRO_TIC80_CONF_OPTS += -GNinja -DBUILD_PLAYER=OFF -DBUILD_SOKOL=OFF -DBUILD_SDL=OFF -DBUILD_DEMO_CARTS=OFF -DBUILD_LIBRETRO=ON \
                            -DBUILD_WITH_JANET=OFF -DBUILD_WITH_MRUBY=OFF -DCMAKE_BUILD_TYPE=Release

define LIBRETRO_TIC80_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(LIBRETRO_TIC80_BUILDDIR)
endef

define LIBRETRO_TIC80_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/lib/tic80_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/tic80_libretro.so
endef

$(eval $(cmake-package))
