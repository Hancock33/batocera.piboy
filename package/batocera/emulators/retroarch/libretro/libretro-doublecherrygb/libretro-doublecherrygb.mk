################################################################################
#
# libretro-doublecherrygb
#
################################################################################
# Version: Commits on Feb 08, 2026
LIBRETRO_DOUBLECHERRYGB_VERSION = e3c07c7524d3265efa536ee92f2e5c1f6541c479
LIBRETRO_DOUBLECHERRYGB_SITE = $(call github,TimOelrichs,doublecherryGB-libretro,$(LIBRETRO_DOUBLECHERRYGB_VERSION))
LIBRETRO_DOUBLECHERRYGB_LICENSE = GPLv2
LIBRETRO_DOUBLECHERRYGB_EMULATOR_INFO = doublecherrygb.libretro.core.yml

define LIBRETRO_DOUBLECHERRYGB_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)
endef

define LIBRETRO_DOUBLECHERRYGB_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/DoubleCherryGB_libretro.so $(TARGET_DIR)/usr/lib/libretro/doublecherrygb_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
