################################################################################
#
# libretro-ep128emu-core
#
################################################################################
# Version: Commits on Jul 22, 2026
LIBRETRO_EP128EMU_CORE_VERSION = 6af5d03de220e6effcd0ffcd99e0fb8e8c77cc9e
LIBRETRO_EP128EMU_CORE_SITE = $(call github,libretro,ep128emu-core,$(LIBRETRO_EP128EMU_CORE_VERSION))
LIBRETRO_EP128EMU_CORE_LICENSE = GPL-2.0
LIBRETRO_EP128EMU_CORE_EMULATOR_INFO = ep128emu.libretro.core.yml

define LIBRETRO_EP128EMU_CORE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ platform="unix"
endef

define LIBRETRO_EP128EMU_CORE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/ep128emu_core_libretro.so $(TARGET_DIR)/usr/lib/libretro/ep128emu_libretro.so
	$(INSTALL) -D $(@D)/ep128emu_core_libretro.info $(TARGET_DIR)/usr/share/libretro/info/ep128emu_core_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
