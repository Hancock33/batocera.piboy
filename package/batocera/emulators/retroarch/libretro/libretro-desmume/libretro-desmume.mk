################################################################################
#
# libretro-desmume
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_DESMUME_VERSION = 7f05a8d447b00acd9e0798aee97b4f72eb505ef9
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