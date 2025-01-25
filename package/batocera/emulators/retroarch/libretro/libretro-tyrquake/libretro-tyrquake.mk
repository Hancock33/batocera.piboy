################################################################################
#
# libretro-tyrquake
#
################################################################################
# Version: Commits on Dec 27, 2024
LIBRETRO_TYRQUAKE_VERSION = 9dcc3ff4ccf96d2f7aa029b738f2c90685b9257f
LIBRETRO_TYRQUAKE_SITE = $(call github,libretro,tyrquake,$(LIBRETRO_TYRQUAKE_VERSION))
LIBRETRO_TYRQUAKE_LICENSE = GPLv2
LIBRETRO_TYRQUAKE_DEPENDENCIES += retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_TYRQUAKE_PLATFORM = armv
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RP1),y)
    LIBRETRO_TYRQUAKE_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_TYRQUAKE_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_TYRQUAKE_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_TYRQUAKE_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_TYRQUAKE_PLATFORM = rpi5_64
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_TYRQUAKE_PLATFORM = unix
else
    LIBRETRO_TYRQUAKE_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_TYRQUAKE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_TYRQUAKE_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_TYRQUAKE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_TYRQUAKE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/tyrquake_libretro.so $(TARGET_DIR)/usr/lib/libretro/tyrquake_libretro.so
endef

$(eval $(generic-package))
