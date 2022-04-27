################################################################################
#
# libretro-fuse
#
################################################################################
# Version: Commits on Apr 25, 2022
LIBRETRO_FUSE_VERSION = 4269f1507469429dad8cff136bb0a535e7b7f1ef
LIBRETRO_FUSE_SITE = $(call github,libretro,fuse-libretro,$(LIBRETRO_FUSE_VERSION))
LIBRETRO_FUSE_LICENSE = GPLv3

LIBRETRO_FUSE_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI1),y)
LIBRETRO_FUSE_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI2),y)
LIBRETRO_FUSE_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3)$(BR2_PACKAGE_BATOCERA_TARGET_RPIZERO2),y)
    ifeq ($(BR2_arm),y)
        LIBRETRO_FUSE_PLATFORM = rpi3
    else
        LIBRETRO_FUSE_PLATFORM = rpi3_64
    endif

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_FUSE_PLATFORM = rpi4_64
endif

define LIBRETRO_FUSE_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_FUSE_PLATFORM)"
endef

define LIBRETRO_FUSE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/fuse_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/fuse_libretro.so
endef

$(eval $(generic-package))
