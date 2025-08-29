################################################################################
#
# libretro-clownmdemu
#
################################################################################
# Version: Commits on Aug 29, 2025
LIBRETRO_CLOWNMDEMU_VERSION = 0e642c0c2cef837113d010af5eabb5b34bb03056
LIBRETRO_CLOWNMDEMU_SITE = https://github.com/Clownacy/clownmdemu-libretro
LIBRETRO_CLOWNMDEMU_SITE_METHOD=git
LIBRETRO_CLOWNMDEMU_GIT_SUBMODULES=YES
LIBRETRO_CLOWNMDEMU_LICENSE = GPLv2

define LIBRETRO_CLOWNMDEMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/clownmdemu_libretro.so $(TARGET_DIR)/usr/lib/libretro/clownmdemu_libretro.so
endef

$(eval $(cmake-package))
