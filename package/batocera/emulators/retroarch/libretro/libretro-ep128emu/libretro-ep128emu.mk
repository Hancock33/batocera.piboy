################################################################################
#
# libretro-ep128emu
#
################################################################################
# Version: Commits on Mar 30, 2026
LIBRETRO_EP128EMU_VERSION = 47e5c635f1f187cd447fadc3b4512c5f0da66173
LIBRETRO_EP128EMU_SITE = $(call github,libretro,ep128emu-core,$(LIBRETRO_EP128EMU_VERSION))
LIBRETRO_EP128EMU_LICENSE = GPL-2.0
LIBRETRO_EP128EMU_EMULATOR_INFO = ep128emu.libretro.core.yml

define LIBRETRO_EP128EMU_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ platform="unix"
endef

define LIBRETRO_EP128EMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/ep128emu_core_libretro.so $(TARGET_DIR)/usr/lib/libretro/ep128emu_libretro.so
	$(INSTALL) -D $(@D)/ep128emu_core_libretro.info $(TARGET_DIR)/usr/share/libretro/info/ep128emu_core_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
