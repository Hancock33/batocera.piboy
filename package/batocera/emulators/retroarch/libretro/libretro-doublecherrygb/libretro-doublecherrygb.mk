################################################################################
#
# libretro-doublecherrygb
#
################################################################################
# Version: Commits on Jul 28, 2026
LIBRETRO_DOUBLECHERRYGB_VERSION = fd3bcb67ee1da98d6c5ed9f71ee8d88b566084f3
LIBRETRO_DOUBLECHERRYGB_SITE = https://github.com/TimOelrichs/doublecherryGB-libretro.git
LIBRETRO_DOUBLECHERRYGB_SITE_METHOD=git
LIBRETRO_DOUBLECHERRYGB_GIT_SUBMODULES=YES
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
