################################################################################
#
# libretro-doublecherrygb
#
################################################################################
# Version: Commits on Jul 04, 2025
LIBRETRO_DOUBLECHERRYGB_VERSION = 5c83d83085b885ae4a626dfbc76c3eb768a41b49
LIBRETRO_DOUBLECHERRYGB_SITE = $(call github,TimOelrichs,doublecherryGB-libretro,$(LIBRETRO_DOUBLECHERRYGB_VERSION))
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
