################################################################################
#
# libretro-doublecherrygb
#
################################################################################
# Version: Commits on Sept 07, 2026
LIBRETRO_DOUBLECHERRYGB_VERSION = 493a9ab52dc9fc17965e413a119b76d1b94d7261
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
