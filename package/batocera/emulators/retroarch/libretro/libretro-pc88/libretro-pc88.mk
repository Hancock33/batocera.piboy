################################################################################
#
# libretro-pc88
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_PC88_VERSION = 28b37bafd3fb1e3a812c50a5ddca94c5fd68e5fd
LIBRETRO_PC88_SITE = $(call github,libretro,quasi88-libretro,$(LIBRETRO_PC88_VERSION))
LIBRETRO_PC88_LICENSE = BSD 3-Clause
LIBRETRO_PC88_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_PC88_PLATFORM = unix-rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_PC88_PLATFORM = unix-rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_PC88_PLATFORM = unix-rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_PC88_PLATFORM = unix-rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_PC88_PLATFORM = unix-rpi5
else
    LIBRETRO_PC88_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_PC88_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_PC88_PLATFORM)"
endef

define LIBRETRO_PC88_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/quasi88
	$(INSTALL) -D $(@D)/quasi88_libretro.so $(TARGET_DIR)/usr/lib/libretro/quasi88_libretro.so
endef

$(eval $(generic-package))
