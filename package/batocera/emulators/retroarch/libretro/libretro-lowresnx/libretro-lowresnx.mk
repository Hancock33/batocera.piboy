################################################################################
#
# LOWRESNX
#
################################################################################
# Version: Commits on Apr 04, 2022
LIBRETRO_LOWRESNX_VERSION = 726016d37bc7b18e6e2fac0140b7d85b19374c7e
LIBRETRO_LOWRESNX_SITE = $(call github,timoinutilis,lowres-nx,$(LIBRETRO_LOWRESNX_VERSION))
LIBRETRO_LOWRESNX_LICENSE = ZLIB

define LIBRETRO_LOWRESNX_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/platform/LibRetro/ -f Makefile platform="unix"
endef

define LIBRETRO_LOWRESNX_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/platform/LibRetro/lowresnx_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/lowresnx_libretro.so
endef

$(eval $(generic-package))
