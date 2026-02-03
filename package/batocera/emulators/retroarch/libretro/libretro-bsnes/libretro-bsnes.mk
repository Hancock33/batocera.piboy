################################################################################
#
# libretro-bsnes
#
################################################################################
# Version: Commits on Jan 16, 2026
LIBRETRO_BSNES_VERSION = d0a61b2c679bc73286be5471b222b1f1ebfb67b9
LIBRETRO_BSNES_SITE = $(call github,libretro,bsnes-libretro,$(LIBRETRO_BSNES_VERSION))

LIBRETRO_BSNES_LICENSE = GPLv3
LIBRETRO_BSNES_LICENSE_FILE = LICENSE.txt
LIBRETRO_BSNES_DEPENDENCIES += retroarch
LIBRETRO_BSNES_EMULATOR_INFO = bsnes.libretro.core.yml

define LIBRETRO_BSNES_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_BSNES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/bsnes_libretro.so $(TARGET_DIR)/usr/lib/libretro/bsnes_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))