################################################################################
#
# libretro-retro8
#
################################################################################
# Version: Commits on Jul 01, 2024
LIBRETRO_RETRO8_VERSION = c9a3a9791f147043c08a3c8ee42aad231f37fe42
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
