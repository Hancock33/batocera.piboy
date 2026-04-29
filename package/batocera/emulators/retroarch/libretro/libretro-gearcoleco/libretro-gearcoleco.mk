################################################################################
#
# libretro-gearcoleco
#
################################################################################
# Version: Commits on Apr 29, 2026
LIBRETRO_GEARCOLECO_VERSION = a4f8532e89de0a1cfa4679445ba8cad2e704a425
LIBRETRO_GEARCOLECO_SITE = $(call github,drhelius,Gearcoleco,$(LIBRETRO_GEARCOLECO_VERSION))
LIBRETRO_GEARCOLECO_LICENSE = GPLv3
LIBRETRO_GEARCOLECO_DEPENDENCIES = retroarch
LIBRETRO_GEARCOLECO_EMULATOR_INFO = gearcoleco.libretro.core.yml

define LIBRETRO_GEARCOLECO_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/platforms/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
		$(@D)/platforms/libretro -f Makefile platform=unix
endef

define LIBRETRO_GEARCOLECO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/platforms/libretro/gearcoleco_libretro.so   $(TARGET_DIR)/usr/lib/libretro/gearcoleco_libretro.so
	$(INSTALL) -D $(@D)/platforms/libretro/gearcoleco_libretro.info $(TARGET_DIR)/usr/share/libretro/info/gearcoleco_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
