################################################################################
#
# libretro-freej2me
#
################################################################################
# Version: Commits on Feb 09, 2026
LIBRETRO_FREEJ2ME_VERSION = 1c456d78b0e4ea0edc73dc1d50e95a8c6f7e1bc2
LIBRETRO_FREEJ2ME_SITE = $(call github,TASEmulators,freej2me-plus,$(LIBRETRO_FREEJ2ME_VERSION))
LIBRETRO_FREEJ2ME_LICENSE = GPL-3.0
LIBRETRO_FREEJ2ME_EMULATOR_INFO = freej2me.libretro.core.yml

define LIBRETRO_FREEJ2ME_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) CFLAGS="" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/libretro/ -f Makefile platform="unix"
endef

define LIBRETRO_FREEJ2ME_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/src/libretro/freej2me_libretro.so $(TARGET_DIR)/usr/lib/libretro/freej2me_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
