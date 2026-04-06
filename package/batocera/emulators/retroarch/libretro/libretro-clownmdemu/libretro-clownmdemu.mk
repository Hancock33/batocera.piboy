################################################################################
#
# libretro-clownmdemu
#
################################################################################
# Version: Commits on Apr 06, 2026
LIBRETRO_CLOWNMDEMU_VERSION = e5bda31351074da50931bd6226e2f6ad31d96733
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
