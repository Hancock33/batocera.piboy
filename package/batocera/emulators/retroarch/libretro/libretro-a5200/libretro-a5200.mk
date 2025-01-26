################################################################################
#
# libretro-a5200
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_A5200_VERSION = 526404072821bb2021fab16f8c5dbbca300512c8
LIBRETRO_A5200_SITE = $(call github,libretro,a5200,$(LIBRETRO_A5200_VERSION))
LIBRETRO_A5200_LICENSE = GPLv2
LIBRETRO_A5200_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_A5200_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_A5200_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_A5200_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_A5200_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_A5200_PLATFORM = rpi5
else ifeq ($(BR2_arm),y)
    LIBRETRO_A5200_PLATFORM = ARCH=armv
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_A5200_PLATFORM = ARCH=aarch64
else
    LIBRETRO_A5200_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_A5200_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_A5200_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_A5200_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_A5200_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/a5200_libretro.so $(TARGET_DIR)/usr/lib/libretro/a5200_libretro.so
endef

$(eval $(generic-package))
