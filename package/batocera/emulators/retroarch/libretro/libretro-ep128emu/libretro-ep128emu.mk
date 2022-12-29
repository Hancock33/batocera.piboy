################################################################################
#
# libretro-ep128emu
#
################################################################################
# Version: Commits on Dec 23, 2022
LIBRETRO_EP128EMU_VERSION = 3e9554dd5011ac30e81fcae3a624a9ef3394f2cf
LIBRETRO_EP128EMU_SITE = $(call github,libretro,ep128emu-core,$(LIBRETRO_EP128EMU_VERSION))
LIBRETRO_EP128EMU_LICENSE = GPL-2.0

define LIBRETRO_EP128EMU_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ platform="unix"
endef

define LIBRETRO_EP128EMU_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/ep128emu_core_libretro.so $(TARGET_DIR)/usr/lib/libretro/ep128emu_libretro.so
	mkdir -p                                      $(TARGET_DIR)/usr/share/libretro/info
	cp $(@D)/ep128emu_core_libretro.info          $(TARGET_DIR)/usr/share/libretro/info/ep128emu_core_libretro.info
endef

$(eval $(generic-package))
