################################################################################
#
# libretro-snes9x-next
#
################################################################################
# Version: Commits on Nov 18, 2024
LIBRETRO_SNES9X_NEXT_VERSION = f9ae8fd28b13070a945a829ccf41cbf90a21d0f7
LIBRETRO_SNES9X_NEXT_SITE = $(call github,libretro,snes9x2010,$(LIBRETRO_SNES9X_NEXT_VERSION))
LIBRETRO_SNES9X_NEXT_LICENSE = Non-commercial
LIBRETRO_SNES9X_NEXT_DEPENDENCIES += retroarch
LIBRETRO_SNES9X_NEXT_EMULATOR_INFO = snes9x_next.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
    LIBRETRO_SNES9X_NEXT_PLATFORM = CortexA73_G12B
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_SNES9X_NEXT_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_SNES9X_NEXT_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_SNES9X_NEXT_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_SNES9X_NEXT_PLATFORM = rpi5_64
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_SNES9X_NEXT_PLATFORM = unix
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_SNES9X_NEXT_PLATFORM = armv cortexa9 neon hardfloat
else
    LIBRETRO_SNES9X_NEXT_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_SNES9X_NEXT_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_SNES9X_NEXT_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_SNES9X_NEXT_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_SNES9X_NEXT_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/snes9x2010_libretro.so $(TARGET_DIR)/usr/lib/libretro/snes9x_next_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))