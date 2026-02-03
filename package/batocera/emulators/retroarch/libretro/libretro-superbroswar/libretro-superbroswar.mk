################################################################################
#
# libretro-superbroswar
#
################################################################################
# Version: Commits on Dec 12, 2025
LIBRETRO_SUPERBROSWAR_VERSION = ae824f626ad80c8b7ee848698b3d1dcebe9a5ccb
LIBRETRO_SUPERBROSWAR_SITE = https://github.com/libretro/superbroswar-libretro.git
LIBRETRO_SUPERBROSWAR_SITE_METHOD = git
LIBRETRO_SUPERBROSWAR_LICENSE = GPLv3
LIBRETRO_SUPERBROSWAR_GIT_SUBMODULES = YES
LIBRETRO_SUPERBROSWAR_DEPENDENCIES += retroarch
LIBRETRO_SUPERBROSWAR_EMULATOR_INFO = superbroswar.libretro.core.yml

define LIBRETRO_SUPERBROSWAR_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-incompatible-pointer-types|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -I $(@D)/dependencies -f Makefile.libretro platform="unix"
endef

define LIBRETRO_SUPERBROSWAR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/superbroswar_libretro.so $(TARGET_DIR)/usr/lib/libretro/superbroswar_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))