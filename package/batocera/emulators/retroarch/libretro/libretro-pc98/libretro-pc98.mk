################################################################################
#
# libretro-pc98
#
################################################################################
# Version: Commits on Jul 03, 2025
LIBRETRO_PC98_VERSION = d2496ef0a5385edeee1c1853d88bb520e163d3f9
LIBRETRO_PC98_SITE = $(call github,AZO234,NP2kai,$(LIBRETRO_PC98_VERSION))
LIBRETRO_PC98_LICENSE = GPLv3
LIBRETRO_PC98_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_PC98_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_PC98_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_PC98_PLATFORM = rpi3-aarch64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_PC98_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_PC98_PLATFORM = rpi5
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
    LIBRETRO_PC98_PLATFORM = CortexA73_G12B
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_PC98_PLATFORM = odroid
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_XU4),y)
    LIBRETRO_PC98_PLATFORM = odroidxu
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3399),y)
    LIBRETRO_PC98_PLATFORM = RK3399
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_PC98_PLATFORM = unix
else
    LIBRETRO_PC98_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_PC98_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-incompatible-pointer-types -Wno-int-conversion|g" $(@D)/sdl/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/sdl/ -f Makefile.libretro platform="$(LIBRETRO_PC98_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_PC98_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_PC98_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/np2kai
	$(INSTALL) -D $(@D)/sdl/np2kai_libretro.so $(TARGET_DIR)/usr/lib/libretro/np2kai_libretro.so
endef

$(eval $(generic-package))
