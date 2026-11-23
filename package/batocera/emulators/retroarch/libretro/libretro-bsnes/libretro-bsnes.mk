################################################################################
#
# libretro-bsnes
#
################################################################################
# Version: Commits on Nov 23, 2026
LIBRETRO_BSNES_VERSION = 43df590f4ef4255316b3b5476abba6fb5e46fca7
LIBRETRO_BSNES_SITE = $(call github,libretro,bsnes-libretro,$(LIBRETRO_BSNES_VERSION))

LIBRETRO_BSNES_LICENSE = GPL-3.0
LIBRETRO_BSNES_LICENSE_FILES = LICENSE.txt
LIBRETRO_BSNES_DEPENDENCIES += retroarch
LIBRETRO_BSNES_EMULATOR_INFO = bsnes.libretro.core.yml

define LIBRETRO_BSNES_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_BSNES_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/bsnes_libretro.so $(TARGET_DIR)/usr/lib/libretro/bsnes_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
