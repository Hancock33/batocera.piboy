################################################################################
#
# libretro-virtualjaguar
#
################################################################################
# Version: Commits on Apr 03, 2026
LIBRETRO_VIRTUALJAGUAR_VERSION = 68265f930f6120f8f05c1f71c9fc9e417dab0d28
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
