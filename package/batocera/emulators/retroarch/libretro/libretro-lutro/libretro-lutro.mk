################################################################################
#
# libretro-lutro
#
################################################################################
# Version: Commits on May 07, 2025
LIBRETRO_LUTRO_VERSION = 469ddf0e236a2db15bd63b5d8c8daf5cdaa5a588
LIBRETRO_LUTRO_SITE = $(call github,libretro,libretro-lutro,$(LIBRETRO_LUTRO_VERSION))
LIBRETRO_LUTRO_LICENSE = MIT
LIBRETRO_LUTRO_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_LUTRO_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_LUTRO_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_LUTRO_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_LUTRO_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_LUTRO_PLATFORM = rpi5
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_LUTRO_PLATFORM = armv neon
else ifeq ($(BR2_arm),y)
    LIBRETRO_LUTRO_PLATFORM = armv neon
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_LUTRO_PLATFORM = unix
else
    LIBRETRO_LUTRO_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_LUTRO_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_LUTRO_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_LUTRO_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_LUTRO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/lutro_libretro.so $(TARGET_DIR)/usr/lib/libretro/lutro_libretro.so
endef

$(eval $(generic-package))
