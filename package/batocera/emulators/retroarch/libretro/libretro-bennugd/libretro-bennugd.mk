################################################################################
#
# libretro-bennugd
#
################################################################################
# Version: Commits on Sept 21, 2025
LIBRETRO_BENNUGD_VERSION = ffbcbf0b0b2cb95337e599d82f185a6fdafca478
LIBRETRO_BENNUGD_SITE = $(call github,diekleinekuh,BennuGD_libretro,$(LIBRETRO_BENNUGD_VERSION))
LIBRETRO_BENNUGD_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_BENNUGD_LICENSE = GPLv2

LIBRETRO_BENNUGD_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
LIBRETRO_BENNUGD_CONF_OPTS += -Dlibretro_core=ON

define LIBRETRO_BENNUGD_VERSION_DETAILS
	sed -i "s|1234abc|$(LIBRETRO_BENNUGD_VERSION)|" $(@D)/core/include/git.h
endef
LIBRETRO_BENNUGD_PRE_CONFIGURE_HOOKS = LIBRETRO_BENNUGD_VERSION_DETAILS

define LIBRETRO_BENNUGD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/buildroot-build/bennugd_libretro.so	$(TARGET_DIR)/usr/lib/libretro/bennugd_libretro.so
endef

$(eval $(cmake-package))
