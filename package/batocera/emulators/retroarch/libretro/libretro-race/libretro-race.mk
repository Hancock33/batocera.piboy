################################################################################
#
# libretro-race
#
################################################################################
# Version: Commits on Jul 25, 2022
LIBRETRO_RACE_VERSION = cb002043c65276dac592ed0214ae8a6bba82e2b1
LIBRETRO_RACE_SITE = $(call github,libretro,RACE,$(LIBRETRO_RACE_VERSION))
LIBRETRO_RACE_LICENSE = GPL-2.0

define LIBRETRO_RACE_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_RACE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/race_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/race_libretro.so
endef

$(eval $(generic-package))
