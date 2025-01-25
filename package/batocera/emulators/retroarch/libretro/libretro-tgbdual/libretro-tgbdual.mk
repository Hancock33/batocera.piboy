################################################################################
#
# libretro-tgbdual
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_TGBDUAL_VERSION = 8d305769eebd67266c284558f9d3a30498894d3d
LIBRETRO_TGBDUAL_SITE = $(call github,libretro,tgbdual-libretro,$(LIBRETRO_TGBDUAL_VERSION))
LIBRETRO_TGBDUAL_LICENSE = GPLv2
LIBRETRO_TGBDUAL_DEPENDENCIES = retroarch

define LIBRETRO_TGBDUAL_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)
endef

define LIBRETRO_TGBDUAL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/tgbdual_libretro.so $(TARGET_DIR)/usr/lib/libretro/tgbdual_libretro.so
endef

$(eval $(generic-package))
