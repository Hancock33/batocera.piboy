################################################################################
#
# libretro-bsnes
#
################################################################################
# Version: Commits on Feb 02, 2024
LIBRETRO_BSNES_VERSION = dda5b43ed6a552310528509af59bed26af2527f5
LIBRETRO_BSNES_SITE = $(call github,libretro,bsnes-libretro,$(LIBRETRO_BSNES_VERSION))

LIBRETRO_BSNES_LICENSE = GPLv3
LIBRETRO_BSNES_LICENSE_FILE = LICENSE.txt

define LIBRETRO_BSNES_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_BSNES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/bsnes_libretro.so $(TARGET_DIR)/usr/lib/libretro/bsnes_libretro.so
endef

$(eval $(generic-package))

