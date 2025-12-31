################################################################################
#
# libretro-beetle-lynx
#
################################################################################
# Version: Commits on May 10, 2025
LIBRETRO_BEETLE_LYNX_VERSION = efd1797c7aa5a83c354507b1b61ac24222ebaa58
LIBRETRO_BEETLE_LYNX_SITE = $(call github,libretro,beetle-lynx-libretro,$(LIBRETRO_BEETLE_LYNX_VERSION))
LIBRETRO_BEETLE_LYNX_LICENSE = GPLv2
LIBRETRO_BEETLE_LYNX_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_BEETLE_LYNX_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_BEETLE_LYNX_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_BEETLE_LYNX_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_BEETLE_LYNX_PLATFORM = rpi5_64
else
    LIBRETRO_BEETLE_LYNX_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_BEETLE_LYNX_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_BEETLE_LYNX_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_BEETLE_LYNX_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BEETLE_LYNX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mednafen_lynx_libretro.so $(TARGET_DIR)/usr/lib/libretro/mednafen_lynx_libretro.so
endef

$(eval $(generic-package))
