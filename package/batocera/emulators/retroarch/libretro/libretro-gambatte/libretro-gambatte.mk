################################################################################
#
# libretro-gambatte
#
################################################################################
# Version: Commits on Oct 04, 2024
LIBRETRO_GAMBATTE_VERSION = 3eeb65e9bcf4b2a7ca24c5cebdfa7e342177ef0f
LIBRETRO_GAMBATTE_SITE = $(call github,libretro,gambatte-libretro,$(LIBRETRO_GAMBATTE_VERSION))
LIBRETRO_GAMBATTE_LICENSE = GPLv2

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_GAMBATTE_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_GAMBATTE_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_GAMBATTE_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_GAMBATTE_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_GAMBATTE_PLATFORM = rpi5
else
    LIBRETRO_GAMBATTE_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_GAMBATTE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_GAMBATTE_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_GAMBATTE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_GAMBATTE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/gambatte_libretro.so $(TARGET_DIR)/usr/lib/libretro/gambatte_libretro.so
endef

$(eval $(generic-package))
