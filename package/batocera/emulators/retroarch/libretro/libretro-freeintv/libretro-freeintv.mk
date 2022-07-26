################################################################################
#
# libretro-freeintv
#
################################################################################
# Version: Commits on Jul 26, 2022
LIBRETRO_FREEINTV_VERSION = e1123081b273c4c4036cb8c05ff4025fb32c18b9
LIBRETRO_FREEINTV_SITE = $(call github,libretro,freeintv,$(LIBRETRO_FREEINTV_VERSION))
LIBRETRO_FREEINTV_LICENSE = GPLv3

LIBRETRO_FREEINTV_PLATFORM = unix

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI1),y)
LIBRETRO_FREEINTV_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI2),y)
LIBRETRO_FREEINTV_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPIZERO2),y)
LIBRETRO_FREEINTV_PLATFORM = rpi3

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3),y)
LIBRETRO_FREEINTV_PLATFORM = rpi3_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_FREEINTV_PLATFORM = rpi4_64
endif

define LIBRETRO_FREEINTV_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform=$(LIBRETRO_FREEINTV_PLATFORM)
endef

define LIBRETRO_FREEINTV_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/freeintv_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/freeintv_libretro.so
endef

$(eval $(generic-package))
