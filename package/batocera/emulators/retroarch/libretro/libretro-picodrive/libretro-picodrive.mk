################################################################################
#
# libretro-picodrive
#
################################################################################
# Version: Commits on Oct 23, 2025
LIBRETRO_PICODRIVE_VERSION = 5b8cdea5cb06fb8d3d8ce7b88695f8dd00b4ac12
LIBRETRO_PICODRIVE_SITE = https://github.com/libretro/picodrive.git
LIBRETRO_PICODRIVE_SITE_METHOD=git
LIBRETRO_PICODRIVE_GIT_SUBMODULES=YES
LIBRETRO_PICODRIVE_DEPENDENCIES = libpng retroarch
LIBRETRO_PICODRIVE_LICENSE = MAME

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_PICODRIVE_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_PICODRIVE_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_PICODRIVE_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_PICODRIVE_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_PICODRIVE_PLATFORM = rpi5
else ifeq ($(BR2_arm),y)
    LIBRETRO_PICODRIVE_PLATFORM += armv neon hardfloat
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_PICODRIVE_PLATFORM = aarch64
else ifeq ($(BR2_RISCV_64),y)
    LIBRETRO_PICODRIVE_PLATFORM = riscv64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_ANY),y)
    LIBRETRO_PICODRIVE_PLATFORM = unix
else
    LIBRETRO_PICODRIVE_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_PICODRIVE_BUILD_CMDS
	$(MAKE) -C $(@D)/cpu/cyclone CONFIG_FILE=$(@D)/cpu/cyclone_config.h

	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-error=incompatible-pointer-types|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro \
		platform="$(LIBRETRO_PICODRIVE_PLATFORM)" \
		GIT_REVISION="$(shell echo $(LIBRETRO_PICODRIVE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_PICODRIVE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/picodrive_libretro.so $(TARGET_DIR)/usr/lib/libretro/picodrive_libretro.so
endef

$(eval $(generic-package))
