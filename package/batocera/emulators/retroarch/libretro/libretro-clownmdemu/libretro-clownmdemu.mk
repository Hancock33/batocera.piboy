################################################################################
#
# libretro-clownmdemu
#
################################################################################
# Version: Commits on Jan 31, 2026
LIBRETRO_CLOWNMDEMU_VERSION = 669491083ed40ca84561ae88a4ba43aac593299d
LIBRETRO_CLOWNMDEMU_SITE = https://github.com/Clownacy/clownmdemu-libretro
LIBRETRO_CLOWNMDEMU_SITE_METHOD=git
LIBRETRO_CLOWNMDEMU_GIT_SUBMODULES=YES
LIBRETRO_CLOWNMDEMU_LICENSE = GPLv2

define LIBRETRO_CLOWNMDEMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/clownmdemu_libretro.so $(TARGET_DIR)/usr/lib/libretro/clownmdemu_libretro.so
endef

$(eval $(cmake-package))
