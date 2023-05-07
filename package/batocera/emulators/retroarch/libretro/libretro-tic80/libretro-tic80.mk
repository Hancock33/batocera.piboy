################################################################################
#
# libretro-tic80
#
################################################################################
# Version: Commits on May 07, 2023
LIBRETRO_TIC80_VERSION = c7c0a7dfa65762468b0056549c90c9b3f59e1d3c
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
