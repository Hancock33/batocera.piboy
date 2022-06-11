################################################################################
#
# libretro-citra
#
################################################################################
# Version: Commits on Jun 11, 2022
LIBRETRO_CITRA_VERSION = 8bbea555ed94ca998ebd5b36c6bd3c39f4297be4
LIBRETRO_CITRA_SITE = https://github.com/libretro/citra.git
LIBRETRO_CITRA_SITE_METHOD=git
LIBRETRO_CITRA_GIT_SUBMODULES=YES
LIBRETRO_CITRA_DEPENDENCIES = boost
LIBRETRO_CITRA_LICENSE = GPLv2+

# Should be set when the package cannot be built inside the source tree but needs a separate build directory.
LIBRETRO_CITRA_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_CITRA_CONF_OPTS  = -DCMAKE_BUILD_TYPE=Release -DENABLE_LIBRETRO=ON \
    -DENABLE_QT=OFF -DENABLE_SDL2=OFF -DENABLE_WEB_SERVICE=OFF \
	-DBUILD_SHARED_LIBS=FALSE

define LIBRETRO_CITRA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/buildroot-build/src/citra_libretro/citra_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/citra_libretro.so
endef

$(eval $(cmake-package))
