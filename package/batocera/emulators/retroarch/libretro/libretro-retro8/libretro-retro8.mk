################################################################################
#
# libretro-retro8
#
################################################################################
# Version: Commits on Nov 01, 2023
LIBRETRO_RETRO8_VERSION = 95b40e58c29b829d96f37c85833f9e51730c5534
LIBRETRO_RETRO8_SITE = $(call github,libretro,retro8,$(LIBRETRO_RETRO8_VERSION))
LIBRETRO_RETRO8_LICENSE = GPLv3.0

define LIBRETRO_RETRO8_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_RETRO8_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/retro8_libretro.so $(TARGET_DIR)/usr/lib/libretro/retro8_libretro.so
endef

$(eval $(generic-package))
