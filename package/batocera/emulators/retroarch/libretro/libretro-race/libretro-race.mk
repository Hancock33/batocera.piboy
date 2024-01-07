################################################################################
#
# libretro-race
#
################################################################################
# Version: Commits on May 28, 2023
LIBRETRO_RACE_VERSION = f65011e6639ccbbbb44b6ffa63ca50c070475df4
LIBRETRO_RACE_SITE = $(call github,libretro,RACE,$(LIBRETRO_RACE_VERSION))
LIBRETRO_RACE_LICENSE = GPL-2.0

define LIBRETRO_RACE_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_RACE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/race_libretro.so $(TARGET_DIR)/usr/lib/libretro/race_libretro.so
endef

$(eval $(generic-package))
