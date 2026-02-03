################################################################################
#
# libretro-pokemini
#
################################################################################
# Version: Commits on May 10, 2025
LIBRETRO_POKEMINI_VERSION = 19095803f1434eb980db6e4004187a4b786e20b6
LIBRETRO_POKEMINI_SITE = $(call github,libretro,PokeMini,$(LIBRETRO_POKEMINI_VERSION))
LIBRETRO_POKEMINI_LICENSE = GPLv3
LIBRETRO_POKEMINI_DEPENDENCIES += retroarch
LIBRETRO_POKEMINI_EMULATOR_INFO = pokemini.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_POKEMINI_PLATFORM = armv
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_POKEMINI_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_POKEMINI_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_POKEMINI_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_POKEMINI_PLATFORM = rpi5
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_POKEMINI_PLATFORM = unix
else
    LIBRETRO_POKEMINI_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_POKEMINI_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_POKEMINI_PLATFORM)"
endef

define LIBRETRO_POKEMINI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/pokemini_libretro.so $(TARGET_DIR)/usr/lib/libretro/pokemini_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))