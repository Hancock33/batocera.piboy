################################################################################
#
# libretro-pocketsnes
#
################################################################################
# Version: Commits on Jun 28, 2024
LIBRETRO_POCKETSNES_VERSION = 2790d03b2266c58444429b4f7d76ba298e0bde87
LIBRETRO_POCKETSNES_SITE = $(call github,libretro,snes9x2002,$(LIBRETRO_POCKETSNES_VERSION))
LIBRETRO_POCKETSNES_LICENSE = Non-commercial

LIBRETRO_POCKETSNES_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_POCKETSNES_PLATFORM = unix-rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_POCKETSNES_PLATFORM = unix-rpi2
endif

define LIBRETRO_POCKETSNES_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_POCKETSNES_PLATFORM)"
endef

define LIBRETRO_POCKETSNES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/snes9x2002_libretro.so $(TARGET_DIR)/usr/lib/libretro/pocketsnes_libretro.so
endef

$(eval $(generic-package))
