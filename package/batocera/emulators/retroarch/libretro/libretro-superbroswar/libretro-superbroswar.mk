################################################################################
#
# libretro-superbroswar
#
################################################################################
# Version: Commits on Jul 22, 2026
LIBRETRO_SUPERBROSWAR_VERSION = 54c6c19e2ed938a072c962359566aa93a7244b88
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
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/superbroswar_libretro.so $(TARGET_DIR)/usr/lib/libretro/superbroswar_libretro.so
	$(INSTALL) -D $(@D)/libretro/superbroswar_libretro.info $(TARGET_DIR)/usr/share/libretro/info/superbroswar_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
