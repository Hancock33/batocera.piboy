################################################################################
#
# libretro-p2000t
#
################################################################################
# Version: Commits on Aug 21, 2026
LIBRETRO_P2000T_VERSION = da0b8cbef2007c907f5db2166847c3209643865d
LIBRETRO_P2000T_SITE = $(call github,p2000t,M2000,$(LIBRETRO_P2000T_VERSION))
LIBRETRO_P2000T_LICENSE = GPL-3.0
LIBRETRO_P2000T_EMULATOR_INFO = p2000t.libretro.core.yml

define LIBRETRO_P2000T_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/src/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/libretro -f Makefile platform="unix"
endef

define LIBRETRO_P2000T_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/src/libretro/m2000_libretro.so $(TARGET_DIR)/usr/lib/libretro/p2000t_libretro.so
	$(INSTALL) -D $(@D)/src/libretro/info/m2000_libretro.info $(TARGET_DIR)/usr/share/libretro/info/p2000t_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
