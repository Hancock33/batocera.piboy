################################################################################
#
# libretro-gearcoleco
#
################################################################################
# Version: Commits on Dec 29, 2025
LIBRETRO_GEARCOLECO_VERSION = ab107c492cfc14fc13b19b5dbca1fab25c5aab99
LIBRETRO_GEARCOLECO_SITE = $(call github,drhelius,Gearcoleco,$(LIBRETRO_GEARCOLECO_VERSION))
LIBRETRO_GEARCOLECO_LICENSE = GPLv3
LIBRETRO_GEARCOLECO_DEPENDENCIES = retroarch

define LIBRETRO_GEARCOLECO_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/platforms/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
		$(@D)/platforms/libretro -f Makefile platform=unix
endef

define LIBRETRO_GEARCOLECO_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/platforms/libretro/gearcoleco_libretro.so   $(TARGET_DIR)/usr/lib/libretro/gearcoleco_libretro.so
	cp -av        $(@D)/platforms/libretro/gearcoleco_libretro.info $(TARGET_DIR)/usr/share/libretro/info/
endef

$(eval $(generic-package))
