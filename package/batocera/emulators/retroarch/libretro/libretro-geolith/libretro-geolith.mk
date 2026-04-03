################################################################################
#
# libretro-geolith
#
################################################################################
# Version: Commits on Apr 03, 2026
LIBRETRO_GEOLITH_VERSION = 4ddcd38809169c200a2b20e363b04c6ef6d76c9a
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
