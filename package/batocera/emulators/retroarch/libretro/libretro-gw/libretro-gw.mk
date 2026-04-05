################################################################################
#
# libretro-gw
#
################################################################################
# Version: Commits on Mar 31, 2026
LIBRETRO_GW_VERSION = f8750d0f37db5f1f779437710f2653e8b1651ded
LIBRETRO_GW_SITE = $(call github,libretro,gw-libretro,$(LIBRETRO_GW_VERSION))
LIBRETRO_GW_LICENSE = GPLv3
LIBRETRO_GW_DEPENDENCIES += retroarch
LIBRETRO_GW_EMULATOR_INFO = gw.libretro.core.yml

define LIBRETRO_GW_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_GW_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/gw_libretro.so $(TARGET_DIR)/usr/lib/libretro/gw_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
