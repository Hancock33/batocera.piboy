################################################################################
#
# libretro-bsnes
#
################################################################################
# Version: Commits on Aug 16, 2024
LIBRETRO_BSNES_VERSION = 4da6b84bf20c36f1a1d097b5f8431d6bf0e4bd48
LIBRETRO_BSNES_SITE = $(call github,libretro,bsnes-libretro,$(LIBRETRO_BSNES_VERSION))

LIBRETRO_BSNES_LICENSE = GPLv3
LIBRETRO_BSNES_LICENSE_FILE = LICENSE.txt

define LIBRETRO_BSNES_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_BSNES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/bsnes_libretro.so $(TARGET_DIR)/usr/lib/libretro/bsnes_libretro.so
endef

$(eval $(generic-package))
