################################################################################
#
# libretro-uae4arm
#
################################################################################
# Version: Commits on Apr 05, 2022
LIBRETRO_UAE4ARM_VERSION = 177c2f0e892adf2603ada9b150e31beffe0f76c3
LIBRETRO_UAE4ARM_SITE = $(call github,chips-fr,uae4arm-rpi,$(LIBRETRO_UAE4ARM_VERSION))
LIBRETRO_UAE4ARM_LICENSE = GPLv2
LIBRETRO_UAE4ARM_DEPENDENCIES = flac mpg123 retroarch zlib
LIBRETRO_UAE4ARM_EMULATOR_INFO = uae4arm.libretro.core.yml
LIBRETRO_UAE4ARM_PLATFORM=$(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_UAE4ARM_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_UAE4ARM_PLATFORM = rpi3-aarch64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_UAE4ARM_PLATFORM = rpi4-aarch64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_UAE4ARM_PLATFORM = rpi5
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_UAE4ARM_PLATFORM = unix aarch64
else
    LIBRETRO_UAE4ARM_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_UAE4ARM_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_UAE4ARM_PLATFORM)"
endef

define LIBRETRO_UAE4ARM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/uae4arm_libretro.so $(TARGET_DIR)/usr/lib/libretro/uae4arm_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))