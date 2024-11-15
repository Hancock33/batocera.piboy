################################################################################
#
# libretro-beetle-pce-fast
#
################################################################################
# Version: Commits on Nov 15, 2024
LIBRETRO_BEETLE_PCE_FAST_VERSION = 931586f0512663f625a6e981d3047a6620281ab5
LIBRETRO_BEETLE_PCE_FAST_SITE = $(call github,libretro,beetle-pce-fast-libretro,$(LIBRETRO_BEETLE_PCE_FAST_VERSION))
LIBRETRO_BEETLE_PCE_FAST_LICENSE = GPLv2

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_BEETLE_PCE_FAST_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_BEETLE_PCE_FAST_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_BEETLE_PCE_FAST_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_BEETLE_PCE_FAST_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_BEETLE_PCE_FAST_PLATFORM = rpi5_64
else
    LIBRETRO_BEETLE_PCE_FAST_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_BEETLE_PCE_FAST_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|HAVE_CDROM = 1|HAVE_CDROM = 0|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) platform="$(LIBRETRO_BEETLE_PCE_FAST_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_BEETLE_PCE_FAST_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BEETLE_PCE_FAST_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mednafen_pce_fast_libretro.so $(TARGET_DIR)/usr/lib/libretro/pce_fast_libretro.so
endef

$(eval $(generic-package))
