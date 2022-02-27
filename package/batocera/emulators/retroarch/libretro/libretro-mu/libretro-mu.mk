################################################################################
#
# MU
#
################################################################################
# Version.: Commits on Feb 26, 2022
LIBRETRO_MU_VERSION = 9d23f9bb6731e44ea84f469e76a7906afae7d67e
LIBRETRO_MU_SITE = $(call github,libretro,Mu,$(LIBRETRO_MU_VERSION))
LIBRETRO_MU_LICENSE = CCANC-3.0

define LIBRETRO_MU_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretroBuildSystem -f Makefile.libretro platform="unix"
endef

define LIBRETRO_MU_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/libretroBuildSystem/mu_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mu_libretro.so
endef

$(eval $(generic-package))
