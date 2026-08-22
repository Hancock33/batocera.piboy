################################################################################
#
# libretro-vemulator
#
################################################################################
# Version: Commits on Aug 22, 2026
LIBRETRO_VEMULATOR_VERSION = dcba4ed266aee7bc874c6c3228f552d4ffa550f2
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
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/vemulator_libretro.so $(TARGET_DIR)/usr/lib/libretro/vemulator_libretro.so
	$(INSTALL) -D $(@D)/vemulator_libretro.info $(TARGET_DIR)/usr/share/libretro/info/vemulator_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
