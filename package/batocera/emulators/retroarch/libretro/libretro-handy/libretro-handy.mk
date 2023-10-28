################################################################################
#
# libretro-handy
#
################################################################################
# Vaersion: Commits on Aug 20, 2023
LIBRETRO_HANDY_VERSION = 0559d3397f689ea453b986311aeac8dbd33afb0b
LIBRETRO_HANDY_SITE = $(call github,libretro,libretro-handy,$(LIBRETRO_HANDY_VERSION))
LIBRETRO_HANDY_LICENSE = Zlib

LIBRETRO_HANDY_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_HANDY_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_HANDY_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_HANDY_PLATFORM = rpi3_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_HANDY_PLATFORM = rpi4_64
endif

define LIBRETRO_HANDY_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ \
	    -f Makefile platform="$(LIBRETRO_HANDY_PLATFORM)" \
        GIT_VERSION="-$(shell echo $(LIBRETRO_HANDY_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_HANDY_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/handy_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/handy_libretro.so
endef

$(eval $(generic-package))
