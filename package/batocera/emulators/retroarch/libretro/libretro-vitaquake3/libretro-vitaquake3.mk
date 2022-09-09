################################################################################
#
# libretro-vitaquake3
#
################################################################################
# Version: Commits on Aug 10, 2022
LIBRETRO_VITAQUAKE3_VERSION = 7a633867cf0a35c71701aef6fc9dd9dfab9c33a9
LIBRETRO_VITAQUAKE3_SITE = $(call github,libretro,vitaquake3,$(LIBRETRO_VITAQUAKE3_VERSION))
LIBRETRO_VITAQUAKE3_LICENSE = GPL-2.0

LIBRETRO_VITAQUAKE3_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_VITAQUAKE3_PLATFORM=rpi4_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPIZERO2),y)
LIBRETRO_VITAQUAKE3_PLATFORM=rpi3

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_VITAQUAKE3_PLATFORM=rpi3_64
endif

define LIBRETRO_VITAQUAKE3_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VITAQUAKE3_PLATFORM)"
endef

define LIBRETRO_VITAQUAKE3_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/VITAQUAKE3_libretro.so $(TARGET_DIR)/usr/lib/libretro/VITAQUAKE3_libretro.so
endef

$(eval $(generic-package))
