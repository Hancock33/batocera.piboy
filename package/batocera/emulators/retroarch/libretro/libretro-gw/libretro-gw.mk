################################################################################
#
# libretro-gw
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_GW_VERSION = 435e5cfd4bf6aea03a84259e9b8dba3daf3ff5bd
LIBRETRO_GW_SITE = $(call github,libretro,gw-libretro,$(LIBRETRO_GW_VERSION))
LIBRETRO_GW_LICENSE = GPLv3
LIBRETRO_GW_DEPENDENCIES += retroarch
LIBRETRO_GW_EMULATOR_INFO = gw.libretro.core.yml

define LIBRETRO_GW_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_GW_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/gw_libretro.so $(TARGET_DIR)/usr/lib/libretro/gw_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
