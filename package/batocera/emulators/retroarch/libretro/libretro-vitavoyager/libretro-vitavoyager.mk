################################################################################
#
# libretro-vitavoyager
#
################################################################################
# Version: Commits on Oct 23, 2019
LIBRETRO_VITAVOYAGER_VERSION = 58b70dd7ea891c2e8ddc37d03a5d58116b0ea118
LIBRETRO_VITAVOYAGER_SITE = $(call github,libretro,vitaVoyager,$(LIBRETRO_VITAVOYAGER_VERSION))
LIBRETRO_VITAVOYAGER_LICENSE = GPL-2.0

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_VITAVOYAGER_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPIZERO2),y)
    LIBRETRO_VITAVOYAGER_PLATFORM = rpi3
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_VITAVOYAGER_PLATFORM = rpi3_64
else
    LIBRETRO_VITAVOYAGER_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_VITAVOYAGER_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VITAVOYAGER_PLATFORM)"
endef

define LIBRETRO_VITAVOYAGER_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/VITAVOYAGER_libretro.so $(TARGET_DIR)/usr/lib/libretro/VITAVOYAGER_libretro.so
endef

$(eval $(generic-package))
