################################################################################
#
# libretro-jollycv
#
################################################################################
# Version: Commits on Mar 12, 2026
LIBRETRO_JOLLYCV_VERSION = 86f8e8607e0e36f596b911c59b04e48052953756
LIBRETRO_JOLLYCV_SITE = $(call github,libretro,jollycv,$(LIBRETRO_JOLLYCV_VERSION))
LIBRETRO_JOLLYCV_LICENSE = GPL-3.0
LIBRETRO_JOLLYCV_DEPENDENCIES = retroarch
LIBRETRO_JOLLYCV_EMULATOR_INFO = jollycv.libretro.core.yml

define LIBRETRO_JOLLYCV_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro -f Makefile platform="unix"
endef

define LIBRETRO_JOLLYCV_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libretro/jollycv_libretro.so $(TARGET_DIR)/usr/lib/libretro/jollycv_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
