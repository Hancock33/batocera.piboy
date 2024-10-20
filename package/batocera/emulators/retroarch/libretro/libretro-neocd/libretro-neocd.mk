################################################################################
#
# libretro-neocd
#
################################################################################
# Version: Commits on Jun 22, 2024
LIBRETRO_NEOCD_VERSION = f87ed9eb4a7bf1243f031044c4e2ae1a7bf7100b
LIBRETRO_NEOCD_SITE = $(call github,libretro,neocd_libretro,$(LIBRETRO_NEOCD_VERSION))
LIBRETRO_NEOCD_LICENSE = GPLv3

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_NEOCD_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_NEOCD_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_NEOCD_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_NEOCD_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_NEOCD_PLATFORM = rpi5
else
    LIBRETRO_NEOCD_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_NEOCD_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_NEOCD_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_NEOCD_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_NEOCD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/neocd_libretro.so $(TARGET_DIR)/usr/lib/libretro/neocd_libretro.so
endef

$(eval $(generic-package))
