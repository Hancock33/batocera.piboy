################################################################################
#
# MU
#
################################################################################
# Version.: Commits on Mar 17, 2021
LIBRETRO_MU_VERSION = 5795ade53199e9d0dd5e4331282c7d14a3899074
LIBRETRO_MU_SITE = $(call github,libretro,Mu,$(LIBRETRO_MU_VERSION))
LIBRETRO_MU_LICENSE = CCANC-3.0

LIBRETRO_MU_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_MU_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretroBuildSystem -f Makefile.libretro platform="$(LIBRETRO_MU_PLATFORM)"
endef

define LIBRETRO_MU_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/libretroBuildSystem/mu_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mu_libretro.so
endef

$(eval $(generic-package))
