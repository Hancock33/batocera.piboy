################################################################################
#
# libretro-race
#
################################################################################
# Version: Commits on Apr 20, 2026
LIBRETRO_RACE_VERSION = 2c543a671fd59d57be94ef5751922e6a55c98106
LIBRETRO_RACE_SITE = $(call github,libretro,RACE,$(LIBRETRO_RACE_VERSION))
LIBRETRO_RACE_LICENSE = GPL-2.0
LIBRETRO_RACE_EMULATOR_INFO = race.libretro.core.yml

define LIBRETRO_RACE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_RACE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/race_libretro.so $(TARGET_DIR)/usr/lib/libretro/race_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
