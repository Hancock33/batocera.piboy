################################################################################
#
# libretro-theodore
#
################################################################################
# Version: Commits on Apr 03, 2026
LIBRETRO_THEODORE_VERSION = 121ae2513d3ee29f0aaf765a64dc086d57e7a4c7
LIBRETRO_THEODORE_SITE = $(call github,Zlika,theodore,$(LIBRETRO_THEODORE_VERSION))
LIBRETRO_THEODORE_LICENSE = GPLv3
LIBRETRO_THEODORE_DEPENDENCIES += retroarch
LIBRETRO_THEODORE_EMULATOR_INFO = theodore.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_THEODORE_PLATFORM = armv
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_THEODORE_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_THEODORE_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_THEODORE_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_THEODORE_PLATFORM = rpi5_64
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_THEODORE_PLATFORM = unix
else
    LIBRETRO_THEODORE_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_THEODORE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_THEODORE_PLATFORM)" \
		GIT_VERSION=" $(shell echo $(LIBRETRO_THEODORE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_THEODORE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/theodore_libretro.so $(TARGET_DIR)/usr/lib/libretro/theodore_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
