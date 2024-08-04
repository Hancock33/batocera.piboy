################################################################################
#
# libretro-superbroswar
#
################################################################################
# Version: Commits on May 28, 2023
LIBRETRO_SUPERBROSWAR_VERSION = 6967c06b8446824565e37fa7deb26994d4997980
LIBRETRO_SUPERBROSWAR_SITE = https://github.com/libretro/superbroswar-libretro.git
LIBRETRO_SUPERBROSWAR_SITE_METHOD = git
LIBRETRO_SUPERBROSWAR_LICENSE = GPLv3
LIBRETRO_SUPERBROSWAR_GIT_SUBMODULES = YES

LIBRETRO_SUPERBROSWAR_CONF_ENV += LDFLAGS="-fPIC" CFLAGS="-fPIC" CXX_FLAGS="-fPIC"

define LIBRETRO_SUPERBROSWAR_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-incompatible-pointer-types|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -I $(@D)/dependencies -f Makefile.libretro platform="unix"
endef

define LIBRETRO_SUPERBROSWAR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/superbroswar_libretro.so $(TARGET_DIR)/usr/lib/libretro/superbroswar_libretro.so
endef

$(eval $(generic-package))
