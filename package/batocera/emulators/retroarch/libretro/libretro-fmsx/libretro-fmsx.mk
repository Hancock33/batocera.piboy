################################################################################
#
# libretro-fmsx
#
################################################################################
# Version: Commits on Jun 28, 2024
LIBRETRO_FMSX_VERSION = cf97a3c6da07d5f8e98c90c907ad987ffea432e0
LIBRETRO_FMSX_SITE = $(call github,libretro,fmsx-libretro,$(LIBRETRO_FMSX_VERSION))
LIBRETRO_FMSX_LICENSE = GPLv2

LIBRETRO_FMSX_PLATFORM = $(LIBRETRO_PLATFORM)
LIBRETRO_FMSX_EXTRA_ARGS =

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_FMSX_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_FMSX_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_FMSX_PLATFORM = rpi3_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_FMSX_PLATFORM = rpi4

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_FMSX_PLATFORM = rpi5

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
LIBRETRO_FMSX_PLATFORM = armv cortexa9 neon hardfloat

else ifeq ($(BR2_aarch64),y)
LIBRETRO_FMSX_PLATFORM = unix
LIBRETRO_FMSX_EXTRA_ARGS += ARCH=arm64

else ifeq ($(BR2_x86_64),y)
LIBRETRO_FMSX_EXTRA_ARGS += ARCH=x86_64
endif

define LIBRETRO_FMSX_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_FMSX_PLATFORM)" $(LIBRETRO_FMSX_EXTRA_ARGS) \
		GIT_VERSION="-$(shell echo $(LIBRETRO_FMSX_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_FMSX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/fmsx_libretro.so $(TARGET_DIR)/usr/lib/libretro/fmsx_libretro.so
endef

$(eval $(generic-package))
