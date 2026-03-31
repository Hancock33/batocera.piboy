################################################################################
#
# libretro-geolith
#
################################################################################
# Version: Commits on Mar 31, 2026
LIBRETRO_GEOLITH_VERSION = 3d3c535e6fdde847d499de5e5baef8c2c240f2b3
LIBRETRO_GEOLITH_SITE = $(call github,libretro,geolith-libretro,$(LIBRETRO_GEOLITH_VERSION))
LIBRETRO_GEOLITH_LICENSE = GPL-3.0
LIBRETRO_GEOLITH_EMULATOR_INFO = geolith.libretro.core.yml

define LIBRETRO_GEOLITH_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro
endef

define LIBRETRO_GEOLITH_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libretro/geolith_libretro.so $(TARGET_DIR)/usr/lib/libretro/geolith_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
