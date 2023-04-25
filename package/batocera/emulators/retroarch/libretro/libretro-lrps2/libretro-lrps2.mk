################################################################################
#
# libretro-lrps2
#
################################################################################
# Version: Commits on Jan 30, 2023
LIBRETRO_LRPS2_VERSION = f3c8743d6a42fe429f703b476fecfdb5655a98a9
LIBRETRO_LRPS2_SITE = https://github.com/libretro/LRPS2.git
LIBRETRO_LRPS2_SITE_METHOD = git
LIBRETRO_LRPS2_GIT_SUBMODULES = YES
LIBRETRO_LRPS2_LICENSE = GPLv2
LIBRETRO_LRPS2_DEPENDENCIES = libaio xz host-xxd host-ninja

LIBRETRO_LRPS2_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release -GNinja
LIBRETRO_LRPS2_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_LRPS2_CONF_OPTS += -DLIBRETRO=ON
LIBRETRO_LRPS2_CONF_OPTS += -DDISABLE_ADVANCE_SIMD=ON

define LIBRETRO_LRPS2_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(LIBRETRO_LRPS2_BUILDDIR)
endef

define LIBRETRO_LRPS2_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/pcsx2/pcsx2_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/lrps2_libretro.so
endef

$(eval $(cmake-package))
