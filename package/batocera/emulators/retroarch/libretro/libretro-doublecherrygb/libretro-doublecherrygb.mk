################################################################################
#
# libretro-doublecherrygb
#
################################################################################
# Version: Commits on Mar 31, 2024
LIBRETRO_DOUBLECHERRYGB_VERSION = 3c0fc38a4b6f5142715fb115affdee0efc1a9dff
LIBRETRO_DOUBLECHERRYGB_SITE = https://github.com/TimOelrichs/doublecherryGB-libretro.git
LIBRETRO_DOUBLECHERRYGB_SITE_METHOD=git
LIBRETRO_DOUBLECHERRYGB_GIT_SUBMODULES=YES
LIBRETRO_DOUBLECHERRYGB_LICENSE = GPLv2

define LIBRETRO_DOUBLECHERRYGB_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)
endef

define LIBRETRO_DOUBLECHERRYGB_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/DoubleCherryGB_libretro.so $(TARGET_DIR)/usr/lib/libretro/doublecherrygb_libretro.so
endef

$(eval $(generic-package))
