################################################################################
#
# tic80 - TIC-80 emulator
#
################################################################################
# Version.: Commits on Feb 11, 2022
LIBRETRO_TIC80_VERSION = f24c4b2f43fda4190fabd8fa78a1c536c25b64b9
LIBRETRO_TIC80_SITE = https://github.com/nesbox/TIC-80.git
LIBRETRO_TIC80_SITE_METHOD=git
LIBRETRO_TIC80_GIT_SUBMODULES=YES
LIBRETRO_TIC80_LICENSE = MIT

LIBRETRO_TIC80_PLATFORM = $(LIBRETRO_PLATFORM)

LIBRETRO_TIC80_CONF_OPTS += \
						-DBUILD_PLAYER=OFF \
                        -DBUILD_SDL=OFF \
                        -DBUILD_SOKOL=OFF \
                        -DBUILD_DEMO_CARTS=OFF \
                        -DBUILD_LIBRETRO=ON \
                        -DBUILD_WITH_MRUBY=OFF \
                        -DCMAKE_BUILD_TYPE=Release

ifeq ($(BR2_PACKAGE_BATOCERA_RPI_ANY),y)
LIBRETRO_TIC80_CONF_OPTS += -DRPI=ON
endif

define LIBRETRO_TIC80_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/lib/tic80_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/tic80_libretro.so
endef

$(eval $(cmake-package))

