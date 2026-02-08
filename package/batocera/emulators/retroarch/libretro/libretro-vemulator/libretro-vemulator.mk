################################################################################
#
# libretro-vemulator
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_VEMULATOR_VERSION = 45d7556667549bb1c1b84d27fbffb7d2a633f5d3
LIBRETRO_VEMULATOR_SITE = $(call github,libretro,vemulator-libretro,$(LIBRETRO_VEMULATOR_VERSION))
LIBRETRO_VEMULATOR_LICENSE = GPLv3
LIBRETRO_VEMULATOR_DEPENDENCIES += retroarch
LIBRETRO_VEMULATOR_EMULATOR_INFO = vemulator.libretro.core.yml

define LIBRETRO_VEMULATOR_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_VEMULATOR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/vemulator_libretro.so $(TARGET_DIR)/usr/lib/libretro/vemulator_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
