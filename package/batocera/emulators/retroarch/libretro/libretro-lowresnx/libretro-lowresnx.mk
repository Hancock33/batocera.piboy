################################################################################
#
# libretro-lowresnx
#
################################################################################
# Version: Commits on Jun 09, 2022
LIBRETRO_LOWRESNX_VERSION = 58af12fc747a1bc657f23c279ed4695ebef0366d
LIBRETRO_LOWRESNX_SITE = $(call github,timoinutilis,lowres-nx,$(LIBRETRO_LOWRESNX_VERSION))
LIBRETRO_LOWRESNX_LICENSE = zlib

define LIBRETRO_LOWRESNX_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/platform/LibRetro -f Makefile \
	    GIT_VERSION="-$(shell echo $(LIBRETRO_LOWRESNX_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_LOWRESNX_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/platform/LibRetro/lowresnx_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/lowresnx_libretro.so
endef

$(eval $(generic-package))
