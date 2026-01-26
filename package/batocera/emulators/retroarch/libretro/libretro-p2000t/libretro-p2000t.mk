################################################################################
#
# libretro-p2000t
#
################################################################################
# Version: Commits on Jan 26, 2026
LIBRETRO_P2000T_VERSION = 4e8ac5f06ef092d2c39051ca4e0b52f70681376d
LIBRETRO_P2000T_SITE = $(call github,p2000t,M2000,$(LIBRETRO_P2000T_VERSION))
LIBRETRO_P2000T_LICENSE = GPL-3.0

define LIBRETRO_P2000T_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/src/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/libretro -f Makefile platform="unix"
endef

define LIBRETRO_P2000T_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/src/libretro/m2000_libretro.so $(TARGET_DIR)/usr/lib/libretro/p2000t_libretro.so
endef

$(eval $(generic-package))
