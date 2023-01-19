################################################################################
#
# libretro-pcsx2
#
################################################################################
# Version: Commits on Jan 19, 2023
LIBRETRO_PCSX2_VERSION = 1f88fb5e663ff8b516dbca00f81fac271333b4aa
LIBRETRO_PCSX2_SITE = https://github.com/libretro/LRPS2.git
LIBRETRO_PCSX2_SITE_METHOD = git
LIBRETRO_PCSX2_GIT_SUBMODULES = YES
LIBRETRO_PCSX2_LICENSE = GPLv2
LIBRETRO_PCSX2_DEPENDENCIES = retroarch libaio xz host-xxd

LIBRETRO_PCSX2_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release -DSDL2_API=ON \
    -DDISABLE_PCSX2_WRAPPER=ON -DPACKAGE_MODE=OFF -DBUILD_SHARED_LIBS=OFF \
	-DENABLE_TESTS=OFF -DENABLE_QT=OFF -DLIBRETRO=ON -DDISABLE_ADVANCE_SIMD=ON \
	-DEXTRA_PLUGINS=TRUE

define LIBRETRO_PCSX2_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/pcsx2/pcsx2_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/pcsx2_libretro.so
endef

$(eval $(cmake-package))
