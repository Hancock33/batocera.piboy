################################################################################
#
# XRICK
#
################################################################################
# Version.: Commits on May 12, 2021
LIBRETRO_XRICK_VERSION = f281911d5b5f99770b7fc1f2aee7dff29a9754c1
LIBRETRO_XRICK_SITE = $(call github,libretro,xrick-libretro,$(LIBRETRO_XRICK_VERSION))
LIBRETRO_XRICK_LICENSE = GPL-3.0

define LIBRETRO_XRICK_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_XRICK_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/xrick_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/xrick_libretro.so
endef

$(eval $(generic-package))
