################################################################################
#
# libretro-bk-emulator
#
################################################################################
# Version: Commits on Jun 28, 2024
LIBRETRO_BK_EMULATOR_VERSION = 31af5ca5f307991eb596ed411d4d0e955c833421
LIBRETRO_BK_EMULATOR_SITE = $(call github,libretro,bk-emulator,$(LIBRETRO_BK_EMULATOR_VERSION))
LIBRETRO_BK_EMULATOR_LICENSE = Custom

LIBRETRO_BK_EMULATOR_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_BK_EMULATOR_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro platform="unix"
endef

define LIBRETRO_BK_EMULATOR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/bk_libretro.so $(TARGET_DIR)/usr/lib/libretro/bk_libretro.so
endef

$(eval $(generic-package))
