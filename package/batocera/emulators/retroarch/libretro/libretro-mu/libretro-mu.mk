################################################################################
#
# libretro-mu
#
################################################################################
# Version: Commits on Oct 10, 2024
LIBRETRO_MU_VERSION = a053b1f2722cfc22238b38940993c68542500e8d
LIBRETRO_MU_SITE = $(call github,libretro,Mu,$(LIBRETRO_MU_VERSION))
LIBRETRO_MU_LICENSE = CCANC-3.0

define LIBRETRO_MU_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretroBuildSystem/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretroBuildSystem -f Makefile.libretro platform="unix"
endef

define LIBRETRO_MU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libretroBuildSystem/mu_libretro.so $(TARGET_DIR)/usr/lib/libretro/mu_libretro.so
endef

$(eval $(generic-package))
