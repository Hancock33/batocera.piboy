################################################################################
#
# libretro-stella
#
################################################################################
# Version: Commits on Nov 26, 2025
LIBRETRO_STELLA_VERSION = ec7ad887c777a7924fdc786a9c5901e65d4c6cd0
LIBRETRO_STELLA_SITE = $(call github,stella-emu,stella,$(LIBRETRO_STELLA_VERSION))
LIBRETRO_STELLA_LICENSE = GPLv2
LIBRETRO_STELLA_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_STELLA_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_STELLA_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_STELLA_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_STELLA_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_STELLA_PLATFORM = rpi5
else
    LIBRETRO_STELLA_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_STELLA_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/src/os/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/os/libretro -f Makefile platform="$(LIBRETRO_STELLA_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_STELLA_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_STELLA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/src/os/libretro/stella_libretro.so $(TARGET_DIR)/usr/lib/libretro/stella_libretro.so
endef

$(eval $(generic-package))
