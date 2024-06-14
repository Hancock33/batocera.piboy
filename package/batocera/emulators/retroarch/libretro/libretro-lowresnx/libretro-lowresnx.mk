################################################################################
#
# libretro-lowresnx
#
################################################################################
# Version: Commits on Jun 14, 2024
LIBRETRO_LOWRESNX_VERSION = 32341bf5ec535a3110165118a7b6e2d5d2c0d199
LIBRETRO_LOWRESNX_SITE = $(call github,timoinutilis,lowres-nx,$(LIBRETRO_LOWRESNX_VERSION))
LIBRETRO_LOWRESNX_LICENSE = zlib

LIBRETRO_LOWRESNX_PLATFORM = $(LIBRETRO_PLATFORM)
ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_LOWRESNX_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_LOWRESNX_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_LOWRESNX_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_LOWRESNX_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_LOWRESNX_PLATFORM = rpi5
endif

LOWRESNX_CONFIGURE_OPTS = GIT_DISCOVERY_ACROSS_FILESYSTEM=1 platform=$(LIBRETRO_LOWRESNX_PLATFORM)

define LIBRETRO_LOWRESNX_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/platform/LibRetro/Makefile
	$(LOWRESNS_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/platform/LibRetro -f Makefile \
		GIT_VERSION="-$(shell echo $(LIBRETRO_LOWRESNX_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_LOWRESNX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/platform/LibRetro/lowresnx_libretro.so $(TARGET_DIR)/usr/lib/libretro/lowresnx_libretro.so
endef

$(eval $(generic-package))
