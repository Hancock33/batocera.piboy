################################################################################
#
# libretro-neocd
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_NEOCD_VERSION = 5eca2c8fd567b5261251c65ecafa8cf5b179d1d2
LIBRETRO_NEOCD_SITE = $(call github,libretro,neocd_libretro,$(LIBRETRO_NEOCD_VERSION))
LIBRETRO_NEOCD_LICENSE = GPLv3
LIBRETRO_NEOCD_DEPENDENCIES = retroarch
LIBRETRO_NEOCD_EMULATOR_INFO = neocd.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
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
$(eval $(emulator-info-package))