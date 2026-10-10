################################################################################
#
# libretro-tic80
#
################################################################################
# Version: Commits on Oct 10, 2026
LIBRETRO_TIC80_VERSION = 4d7f5220bdb82924b43f420ca22c50bc29524369
LIBRETRO_TIC80_SITE = https://github.com/nesbox/TIC-80.git
LIBRETRO_TIC80_SITE_METHOD=git
LIBRETRO_TIC80_GIT_SUBMODULES=YES
LIBRETRO_TIC80_LICENSE = MIT
LIBRETRO_TIC80_DEPENDENCIES = janet retroarch
LIBRETRO_TIC80_EMULATOR_INFO = tic80.libretro.core.yml

LIBRETRO_TIC80_CONF_OPTS += -DBUILD_LIBRETRO=ON
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_SDL=OFF
LIBRETRO_TIC80_CONF_OPTS += -DBUILD_STATIC=ON

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
LIBRETRO_TIC80_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
endif

define LIBRETRO_TIC80_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/bin/tic80_libretro.so $(TARGET_DIR)/usr/lib/libretro/tic80_libretro.so
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
