################################################################################
#
# Super Bros War
#
################################################################################
# Version: Commits on Mar 31, 2022
LIBRETRO_SUPERBROSWAR_VERSION = a8dda0cf701d7a96a3e743c962b727b5e08f4ff1
LIBRETRO_SUPERBROSWAR_SITE = https://github.com/libretro/superbroswar-libretro.git
LIBRETRO_SUPERBROSWAR_SITE_METHOD = git
LIBRETRO_SUPERBROSWAR_LICENSE = GPLv3
LIBRETRO_SUPERBROSWAR_GIT_SUBMODULES = YES

LIBRETRO_SUPERBROSWAR_CONF_ENV += LDFLAGS="-fPIC" CFLAGS="-fPIC" CXX_FLAGS="-fPIC

define LIBRETRO_SUPERBROSWAR_BUILD_CMDS
        $(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -I $(@D)/dependencies -f Makefile.libretro platform="unix"
endef

define LIBRETRO_SUPERBROSWAR_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/superbroswar_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/superbroswar_libretro.so
endef

$(eval $(generic-package))
