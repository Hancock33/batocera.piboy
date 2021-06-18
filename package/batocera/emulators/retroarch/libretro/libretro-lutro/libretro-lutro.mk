################################################################################
#
# LUTRO
#
################################################################################
# Version.: Commits on Jun 18, 2021
LIBRETRO_LUTRO_VERSION = 3171b10a05464cc1fa64ab75c64036b6be26d7e1
LIBRETRO_LUTRO_SITE = $(call github,libretro,libretro-lutro,$(LIBRETRO_LUTRO_VERSION))
LIBRETRO_LUTRO_LICENSE = MIT

LIBRETRO_LUTRO_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
LIBRETRO_LUTRO_PLATFORM = armv neon
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_ODROIDGOA)$(BR2_PACKAGE_BATOCERA_TARGET_GAMEFORCE)$(BR2_arm),yyy)
LIBRETRO_LUTRO_PLATFORM = armv neon
else ifeq ($(BR2_aarch64),y)
LIBRETRO_LUTRO_PLATFORM = unix
endif

define LIBRETRO_LUTRO_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_LUTRO_PLATFORM)"
endef

define LIBRETRO_LUTRO_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/lutro_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/lutro_libretro.so
endef

$(eval $(generic-package))
