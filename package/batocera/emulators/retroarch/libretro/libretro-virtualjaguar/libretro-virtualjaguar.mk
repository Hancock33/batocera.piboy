################################################################################
#
# libretro-virtualjaguar
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_VIRTUALJAGUAR_VERSION = 48096c1f6f8b98cfff048a5cb4e6a86686631072
LIBRETRO_VIRTUALJAGUAR_SITE = $(call github,libretro,virtualjaguar-libretro,$(LIBRETRO_VIRTUALJAGUAR_VERSION))
LIBRETRO_VIRTUALJAGUAR_LICENSE = GPLv3
LIBRETRO_VIRTUALJAGUAR_DEPENDENCIES += retroarch
LIBRETRO_VIRTUALJAGUAR_EMULATOR_INFO = virtualjaguar.libretro.core.yml

define LIBRETRO_VIRTUALJAGUAR_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile \
		platform="unix" GIT_VERSION="-$(shell echo $(LIBRETRO_VIRTUALJAGUAR_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_VIRTUALJAGUAR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/virtualjaguar_libretro.so $(TARGET_DIR)/usr/lib/libretro/virtualjaguar_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
