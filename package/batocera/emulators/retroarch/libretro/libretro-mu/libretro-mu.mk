################################################################################
#
# libretro-mu
#
################################################################################
# Version: Commits on Apr 20, 2026
LIBRETRO_MU_VERSION = de05588fcb1adca6738dc4cf6a2e6e6c447bf2f2
LIBRETRO_MU_SITE = $(call github,libretro,Mu,$(LIBRETRO_MU_VERSION))
LIBRETRO_MU_LICENSE = CCANC-3.0
LIBRETRO_MU_EMULATOR_INFO = mu.libretro.core.yml

define LIBRETRO_MU_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretroBuildSystem/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretroBuildSystem -f Makefile.libretro platform="unix"
endef

define LIBRETRO_MU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/libretroBuildSystem/mu_libretro.so $(TARGET_DIR)/usr/lib/libretro/mu_libretro.so
	$(INSTALL) -D $(@D)/libretroBuildSystem/mu_libretro.info $(TARGET_DIR)/usr/share/libretro/info/mu_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
