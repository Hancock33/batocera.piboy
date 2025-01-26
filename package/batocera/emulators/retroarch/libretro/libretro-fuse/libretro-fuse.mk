################################################################################
#
# libretro-fuse
#
################################################################################
# Version: Commits on Nov 24, 2024
LIBRETRO_FUSE_VERSION = cad85b7b1b864c65734f71aa4a510b6f6536881c
LIBRETRO_FUSE_SITE = $(call github,libretro,fuse-libretro,$(LIBRETRO_FUSE_VERSION))
LIBRETRO_FUSE_LICENSE = GPLv3
LIBRETRO_FUSE_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_FUSE_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_FUSE_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_FUSE_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_FUSE_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_FUSE_PLATFORM = rpi5_64
else
    LIBRETRO_FUSE_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_FUSE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_FUSE_PLATFORM)"
endef

define LIBRETRO_FUSE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/fuse_libretro.so $(TARGET_DIR)/usr/lib/libretro/fuse_libretro.so
endef

$(eval $(generic-package))
