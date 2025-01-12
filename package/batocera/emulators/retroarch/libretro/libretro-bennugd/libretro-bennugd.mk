################################################################################
#
# libretro-bennugd
#
################################################################################
# Version: Commits on Jan 11, 2025
LIBRETRO_BENNUGD_VERSION = 5c131c6b2fb2da72da438ef8191679871ffc1feb
LIBRETRO_BENNUGD_SITE = $(call github,diekleinekuh,BennuGD_libretro,$(LIBRETRO_BENNUGD_VERSION))
LIBRETRO_BENNUGD_LICENSE = GPLv2

LIBRETRO_BENNUGD_SUPPORTS_IN_SOURCE_BUILD = NO

LIBRETRO_BENNUGD_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_BENNUGD_CONF_OPTS += -Dlibretro_core=ON

define LIBRETRO_BENNUGD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/bennugd_libretro.so	$(TARGET_DIR)/usr/lib/libretro/bennugd_libretro.so
endef

$(eval $(cmake-package))
