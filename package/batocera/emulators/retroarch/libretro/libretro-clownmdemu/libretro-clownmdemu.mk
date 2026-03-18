################################################################################
#
# libretro-clownmdemu
#
################################################################################
# Version: Commits on Mar 17, 2026
LIBRETRO_CLOWNMDEMU_VERSION = 7d72183dd479d5f92084ba60d88140456d400ab3
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
