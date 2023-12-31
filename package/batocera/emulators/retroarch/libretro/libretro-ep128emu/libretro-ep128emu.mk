################################################################################
#
# libretro-ep128emu
#
################################################################################
# Version: Commits on Dec 29, 2023
LIBRETRO_EP128EMU_VERSION = cbf1e70eb2059cfacede2e42492cf05c7c6341bd
LIBRETRO_EP128EMU_SITE = $(call github,libretro,ep128emu-core,$(LIBRETRO_EP128EMU_VERSION))
LIBRETRO_EP128EMU_LICENSE = GPL-2.0

define LIBRETRO_EP128EMU_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ platform="unix"
endef

define LIBRETRO_EP128EMU_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/ep128emu_core_libretro.so $(TARGET_DIR)/usr/lib/libretro/ep128emu_libretro.so
	mkdir -p									  $(TARGET_DIR)/usr/share/libretro/info
	cp $(@D)/ep128emu_core_libretro.info		  $(TARGET_DIR)/usr/share/libretro/info/ep128emu_libretro.info
endef

$(eval $(generic-package))
