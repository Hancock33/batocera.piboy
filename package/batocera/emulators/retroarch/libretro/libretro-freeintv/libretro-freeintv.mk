################################################################################
#
# libretro-freeintv
#
################################################################################
# Version: Commits on Mar 31, 2026
LIBRETRO_FREEINTV_VERSION = 9b66d2b3c3406659b2fdfaade7a80f3e62772815
LIBRETRO_FREEINTV_SITE = $(call github,libretro,freeintv,$(LIBRETRO_FREEINTV_VERSION))
LIBRETRO_FREEINTV_LICENSE = GPLv3
LIBRETRO_FREEINTV_DEPENDENCIES += retroarch
LIBRETRO_FREEINTV_EMULATOR_INFO = freeintv.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_FREEINTV_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_FREEINTV_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_FREEINTV_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_FREEINTV_PLATFORM = rpi5_64
else
    LIBRETRO_FREEINTV_PLATFORM = unix
endif

define LIBRETRO_FREEINTV_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform=$(LIBRETRO_FREEINTV_PLATFORM)
endef

define LIBRETRO_FREEINTV_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/freeintv_libretro.so $(TARGET_DIR)/usr/lib/libretro/freeintv_libretro.so
	$(INSTALL) -D $(@D)/FreeIntv_libretro.info $(TARGET_DIR)/usr/share/libretro/info/freeintv_libretro.info
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
