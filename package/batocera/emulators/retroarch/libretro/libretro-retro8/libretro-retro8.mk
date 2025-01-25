################################################################################
#
# libretro-retro8
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_RETRO8_VERSION = a235ff8e3ca1b44bcf88293748d5a492c76a2c7b
LIBRETRO_RETRO8_SITE = $(call github,libretro,retro8,$(LIBRETRO_RETRO8_VERSION))
LIBRETRO_RETRO8_LICENSE = GPLv3.0
LIBRETRO_RETRO8_DEPENDENCIES = retroarch

define LIBRETRO_RETRO8_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_RETRO8_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/retro8_libretro.so $(TARGET_DIR)/usr/lib/libretro/retro8_libretro.so
endef

$(eval $(generic-package))
