################################################################################
#
# libretro-snes9x
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_SNES9X_VERSION = 49f484569ff2aec7ff08e7598a97d6c9e6eae72d
LIBRETRO_SNES9X_SITE = $(call github,libretro,snes9x,$(LIBRETRO_SNES9X_VERSION))
LIBRETRO_SNES9X_LICENSE = Non-commercial
LIBRETRO_SNES9X_DEPENDENCIES = zlib retroarch
LIBRETRO_SNES9X_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S922X),y)
    LIBRETRO_SNES9X_PLATFORM = CortexA73_G12B
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_SNES9X_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_SNES9X_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_SNES9X_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_SNES9X_PLATFORM = rpi5_64
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_SNES9X_PLATFORM = unix
else
    LIBRETRO_SNES9X_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_SNES9X_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	-C $(@D)/libretro -f Makefile platform="$(LIBRETRO_SNES9X_PLATFORM)" \
	LTO="" GIT_VERSION="-$(shell echo $(LIBRETRO_SNES9X_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_SNES9X_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libretro/snes9x_libretro.so $(TARGET_DIR)/usr/lib/libretro/snes9x_libretro.so
endef

$(eval $(generic-package))
