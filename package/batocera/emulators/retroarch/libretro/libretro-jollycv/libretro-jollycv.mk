################################################################################
#
# libretro-jollycv
#
################################################################################
# Version: Commits on Oct 18, 2025
LIBRETRO_JOLLYCV_VERSION = 5b01c1e43f9040bfae25cc9f9dfb14d73951ec3c
LIBRETRO_JOLLYCV_SITE = $(call github,libretro,jollycv,$(LIBRETRO_JOLLYCV_VERSION))
LIBRETRO_JOLLYCV_LICENSE = GPL-3.0
LIBRETRO_JOLLYCV_DEPENDENCIES = retroarch

define LIBRETRO_JOLLYCV_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro -f Makefile platform="unix"
endef

define LIBRETRO_JOLLYCV_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libretro/jollycv_libretro.so $(TARGET_DIR)/usr/lib/libretro/jollycv_libretro.so
endef

$(eval $(generic-package))
