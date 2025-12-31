################################################################################
#
# libretro-prosystem
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_PROSYSTEM_VERSION = acae250da8d98b8b9707cd499e2a0bf6d8500652
LIBRETRO_PROSYSTEM_SITE = $(call github,libretro,prosystem-libretro,$(LIBRETRO_PROSYSTEM_VERSION))
LIBRETRO_PROSYSTEM_LICENSE = GPLv2
LIBRETRO_PROSYSTEM_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_PROSYSTEM_PLATFORM = armv
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_PROSYSTEM_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_PROSYSTEM_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_PROSYSTEM_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_PROSYSTEM_PLATFORM = rpi5
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_PROSYSTEM_PLATFORM = unix
else
    LIBRETRO_PROSYSTEM_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_PROSYSTEM_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_PROSYSTEM_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_PROSYSTEM_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_PROSYSTEM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/prosystem_libretro.so $(TARGET_DIR)/usr/lib/libretro/prosystem_libretro.so
endef

$(eval $(generic-package))
