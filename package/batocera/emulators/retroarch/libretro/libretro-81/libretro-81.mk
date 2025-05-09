################################################################################
#
# libretro-81
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_81_VERSION = ffc99f27f092addc9ddd34dd0e3a3d4d1c053cbf
LIBRETRO_81_SITE = $(call github,libretro,81-libretro,$(LIBRETRO_81_VERSION))
LIBRETRO_81_LICENSE = GPLv3
LIBRETRO_81_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_81_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_81_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_81_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_81_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_81_PLATFORM = rpi5
else
    LIBRETRO_81_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_81_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_81_PLATFORM)"
endef

define LIBRETRO_81_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D $(@D)/81_libretro.so $(TARGET_DIR)/usr/lib/libretro/81_libretro.so
	$(INSTALL) -D -t $(TARGET_DIR)/usr/share/evmapy/ $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-81/zx81.keys
endef

$(eval $(generic-package))
