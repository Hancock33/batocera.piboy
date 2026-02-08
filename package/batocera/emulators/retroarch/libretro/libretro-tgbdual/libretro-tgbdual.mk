################################################################################
#
# libretro-tgbdual
#
################################################################################
# Version: Commits on May 10, 2025
LIBRETRO_TGBDUAL_VERSION = 933707c0ba8f12360f6d79712f735a917713709a
LIBRETRO_TGBDUAL_SITE = $(call github,libretro,tgbdual-libretro,$(LIBRETRO_TGBDUAL_VERSION))
LIBRETRO_TGBDUAL_LICENSE = GPLv2
LIBRETRO_TGBDUAL_DEPENDENCIES += retroarch
LIBRETRO_TGBDUAL_EMULATOR_INFO = tgbdual.libretro.core.yml

define LIBRETRO_TGBDUAL_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)
endef

define LIBRETRO_TGBDUAL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/tgbdual_libretro.so $(TARGET_DIR)/usr/lib/libretro/tgbdual_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
