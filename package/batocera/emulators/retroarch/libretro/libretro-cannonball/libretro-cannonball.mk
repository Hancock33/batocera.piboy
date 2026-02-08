################################################################################
#
# libretro-cannonball
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_CANNONBALL_VERSION = 5137a791d229a5b9c7c089cf1edcce4db3c57d64
LIBRETRO_CANNONBALL_SITE = $(call github,libretro,cannonball,$(LIBRETRO_CANNONBALL_VERSION))
LIBRETRO_CANNONBALL_LICENSE = COPYRIGHT
LIBRETRO_CANNONBALL_NON_COMMERCIAL = yes
LIBRETRO_CANNONBALL_EMULATOR_INFO = cannonball.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
LIBRETRO_CANNONBALL_PLATFORM = armv
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_CANNONBALL_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_CANNONBALL_PLATFORM = rpi4_64
else ifeq ($(BR2_aarch64),y)
LIBRETRO_CANNONBALL_PLATFORM = unix
else
LIBRETRO_CANNONBALL_PLATFORM = unix
endif

define LIBRETRO_CANNONBALL_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_CANNONBALL_PLATFORM)"
endef

define LIBRETRO_CANNONBALL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/cannonball/res
	$(INSTALL) -D $(@D)/cannonball_libretro.so	$(TARGET_DIR)/usr/lib/libretro/cannonball_libretro.so
	$(INSTALL) -D $(@D)/roms/roms.txt 			$(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/cannonball/roms_needed.txt
	$(INSTALL) -D $(@D)/res/*.bin				$(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/cannonball/res/
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
