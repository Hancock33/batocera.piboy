################################################################################
#
# libretro-gearcoleco
#
################################################################################
# Version: Commits on Jan 04, 2026
LIBRETRO_GEARCOLECO_VERSION = 41545a0d1a3ca0856f6dfe09c91ff80c391c37d7
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
