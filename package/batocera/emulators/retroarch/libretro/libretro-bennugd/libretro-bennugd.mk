################################################################################
#
# libretro-bennugd
#
################################################################################
# Version: Commits on Oct 30, 2024
LIBRETRO_BENNUGD_VERSION = a0f3b60d093b7ec0f885e08c18a5ca5943bbc172
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
