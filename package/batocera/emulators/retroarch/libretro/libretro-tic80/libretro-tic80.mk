################################################################################
#
# libretro-tic80
#
################################################################################
# Version: Commits on Mar 08, 2025
LIBRETRO_TIC80_VERSION = fcfd7c9862e9157512bcab53affecd592b320131
LIBRETRO_TIC80_SITE = https://github.com/nesbox/TIC-80.git
LIBRETRO_TIC80_SITE_METHOD=git
LIBRETRO_TIC80_GIT_SUBMODULES=YES
LIBRETRO_TIC80_LICENSE = MIT
LIBRETRO_TIC80_DEPENDENCIES = janet retroarch

LIBRETRO_TIC80_CONF_OPTS += -DBUILD_LIBRETRO=ON
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_PLAYER=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_SOKOL=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_SDL=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_DEMO_CARTS=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_WITH_MRUBY=OFF

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
endif

define LIBRETRO_TIC80_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/bin/tic80_libretro.so $(TARGET_DIR)/usr/lib/libretro/tic80_libretro.so
endef

$(eval $(cmake-package))
