################################################################################
#
# libretro-clownmdemu
#
################################################################################
# Version: Commits on Feb 13, 2026
LIBRETRO_CLOWNMDEMU_VERSION = c21c64378f640056966a3bb5c9c8e01c0f22ea96
LIBRETRO_CLOWNMDEMU_SITE = https://github.com/Clownacy/clownmdemu-libretro
LIBRETRO_CLOWNMDEMU_SITE_METHOD=git
LIBRETRO_CLOWNMDEMU_GIT_SUBMODULES=YES
LIBRETRO_CLOWNMDEMU_LICENSE = GPLv2
LIBRETRO_CLOWNMDEMU_EMULATOR_INFO = clownmdemu.libretro.core.yml

define LIBRETRO_CLOWNMDEMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/clownmdemu_libretro.so $(TARGET_DIR)/usr/lib/libretro/clownmdemu_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
