################################################################################
#
# 2048
#
################################################################################
# Version.: Commits on Aug 14, 2021
LIBRETRO_2048_VERSION = 1ff7d5c3835ad89e5ce5eaa409b91c9a17cc1aa0
LIBRETRO_2048_SITE = $(call github,libretro,libretro-2048,$(LIBRETRO_2048_VERSION))
LIBRETRO_2048_LICENSE = UNLICENSE
LIBRETRO_2048_LICENSE_FILES = LICENSE

define LIBRETRO_2048_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_2048_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/2048_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/2048_libretro.so
endef

$(eval $(generic-package))
