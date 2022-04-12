################################################################################
#
# libretro-81
#
################################################################################
# Version: Commits on Apr 12, 2022
LIBRETRO_81_VERSION = 2e34567a320cba27b9162b1776db4de3cdb7cf03
LIBRETRO_81_SITE = $(call github,libretro,81-libretro,$(LIBRETRO_81_VERSION))
LIBRETRO_81_LICENSE = GPLv3

LIBRETRO_81_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI1),y)
LIBRETRO_81_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI2),y)
LIBRETRO_81_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3)$(BR2_PACKAGE_BATOCERA_TARGET_RPIZERO2),y)
    ifeq ($(BR2_arm),y)
        LIBRETRO_81_PLATFORM = rpi3
    else
        LIBRETRO_81_PLATFORM = rpi3_64
    endif

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_81_PLATFORM = rpi4_64
endif

define LIBRETRO_81_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_81_PLATFORM)"
endef

define LIBRETRO_81_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/81_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/81_libretro.so
endef

$(eval $(generic-package))
