################################################################################
#
# libretro-ep128emu
#
################################################################################
# Version: Commits on Jul 20, 2025
LIBRETRO_EP128EMU_VERSION = edc6da073ec4e6120edfe6d063e49415f21bbdf4
LIBRETRO_EP128EMU_SITE = $(call github,libretro,ep128emu-core,$(LIBRETRO_EP128EMU_VERSION))
LIBRETRO_EP128EMU_LICENSE = GPL-2.0

define LIBRETRO_EP128EMU_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ platform="unix"
endef

define LIBRETRO_EP128EMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/ep128emu_core_libretro.so	$(TARGET_DIR)/usr/lib/libretro/ep128emu_libretro.so
	cp $(@D)/ep128emu_core_libretro.info			$(TARGET_DIR)/usr/share/libretro/info/ep128emu_libretro.info
endef

$(eval $(generic-package))
