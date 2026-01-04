################################################################################
#
# libretro-freej2me
#
################################################################################
# Version: Commits on Dec 29, 2025
LIBRETRO_FREEJ2ME_VERSION = 331ee719d6c76815498e1c288b97429cd18c9da6
LIBRETRO_FREEJ2ME_SITE = $(call github,TASEmulators,freej2me-plus,$(LIBRETRO_FREEJ2ME_VERSION))
LIBRETRO_FREEJ2ME_LICENSE = GPL-3.0

define LIBRETRO_FREEJ2ME_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) CFLAGS="" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/libretro/ -f Makefile platform="unix"
endef

define LIBRETRO_FREEJ2ME_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/src/libretro/freej2me_libretro.so $(TARGET_DIR)/usr/lib/libretro/freej2me_libretro.so
endef

$(eval $(generic-package))
