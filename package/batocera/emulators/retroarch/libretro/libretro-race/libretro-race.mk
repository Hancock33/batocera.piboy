################################################################################
#
# libretro-race
#
################################################################################
# Version: Commits on Nov 16, 2026
LIBRETRO_RACE_VERSION = c660d9ab5aafb47aefff90182ca90d319ad9b077
LIBRETRO_RACE_SITE = $(call github,libretro,RACE,$(LIBRETRO_RACE_VERSION))
LIBRETRO_RACE_LICENSE = GPL-2.0
LIBRETRO_RACE_EMULATOR_INFO = race.libretro.core.yml

define LIBRETRO_RACE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_RACE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/race_libretro.so $(TARGET_DIR)/usr/lib/libretro/race_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
