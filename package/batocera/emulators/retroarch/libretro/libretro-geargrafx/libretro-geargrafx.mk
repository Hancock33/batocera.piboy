################################################################################
#
# libretro-geargrafx
#
################################################################################
# Version: Commits on Mar 15, 2026
LIBRETRO_GEARGRAFX_VERSION = 8467c513de2346a3de1d8e6b0d4038c1bdb60c19
LIBRETRO_GEARGRAFX_SITE = $(call github,drhelius,Geargrafx,$(LIBRETRO_GEARGRAFX_VERSION))
LIBRETRO_GEARGRAFX_LICENSE = GPLv3
LIBRETRO_GEARGRAFX_EMULATOR_INFO = geargrafx.libretro.core.yml

LIBRETRO_GEARGRAFX_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_GEARGRAFX_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/platforms/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
		$(@D)/platforms/libretro -f Makefile platform="$(LIBRETRO_GEARGRAFX_PLATFORM)"
endef

define LIBRETRO_GEARGRAFX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/platforms/libretro/geargrafx_libretro.so $(TARGET_DIR)/usr/lib/libretro/geargrafx_libretro.so
	$(INSTALL) -D $(@D)/platforms/libretro/geargrafx_libretro.info $(TARGET_DIR)/usr/share/libretro/info/geargrafx_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
