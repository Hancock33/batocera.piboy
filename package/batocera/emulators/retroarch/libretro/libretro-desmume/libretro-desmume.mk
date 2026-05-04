################################################################################
#
# libretro-desmume
#
################################################################################
# Version: Commits on May 03, 2026
LIBRETRO_DESMUME_VERSION = a55c393de8ecf19df8111f65b8e12d08b9616520
LIBRETRO_DESMUME_SITE = $(call github,libretro,desmume,$(LIBRETRO_DESMUME_VERSION))
LIBRETRO_DESMUME_LICENSE = GPLv2

LIBRETRO_DESMUME_DEPENDENCIES = libpcap retroarch
LIBRETRO_DESMUME_EMULATOR_INFO = desmume.libretro.core.yml

define LIBRETRO_DESMUME_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/desmume/src/frontend/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/desmume/src/frontend/libretro -f Makefile platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_DESMUME_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/desmume/src/frontend/libretro/desmume_libretro.so $(TARGET_DIR)/usr/lib/libretro/desmume_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
