################################################################################
#
# BK-0010 / BK-0010.01 / BK-0011 emulator
#
################################################################################
# Version.: Commits on Mar 07, 2022
LIBRETRO_BK_EMULATOR_VERSION = 7cfe20947865619adbc8c5b231877d0a0f96c921
LIBRETRO_BK_EMULATOR_SITE = $(call github,libretro,bk-emulator,$(LIBRETRO_BK_EMULATOR_VERSION))
LIBRETRO_BK_EMULATOR_LICENSE = Custom

LIBRETRO_BK_EMULATOR_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_BK_EMULATOR_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro platform="unix"
endef

define LIBRETRO_BK_EMULATOR_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/bk_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/bk_libretro.so
endef

$(eval $(generic-package))
