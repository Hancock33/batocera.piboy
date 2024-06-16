################################################################################
#
# libretro-mame2010
#
################################################################################
# Version: Commits on Jun 14, 2022
LIBRETRO_MAME2010_VERSION = 5f524dd5fca63ec1dcf5cca63885286109937587
LIBRETRO_MAME2010_SITE = $(call github,libretro,mame2010-libretro,$(LIBRETRO_MAME2010_VERSION))
LIBRETRO_MAME2010_LICENSE = MAME

LIBRETRO_MAME2010_DEPENDENCIES = zlib

LIBRETRO_MAME2010_PLATFORM = $(LIBRETRO_PLATFORM)
LIBRETRO_MAME2010_EXTRA_ARGS = VRENDER=soft emulator

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_MAME2010_PLATFORM = rpi2
LIBRETRO_MAME2010_EXTRA_ARGS += PTR64=0 ARM_ENABLED=1 LCPU=arm

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_MAME2010_PLATFORM = rpi3_64
LIBRETRO_MAME2010_EXTRA_ARGS += PTR64=1 ARM_ENABLED=1 LCPU=arm64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_MAME2010_PLATFORM = rpi4
LIBRETRO_MAME2010_EXTRA_ARGS += PTR64=1 ARM_ENABLED=1 LCPU=arm64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_MAME2010_PLATFORM = rpi5
LIBRETRO_MAME2010_EXTRA_ARGS += PTR64=1 ARM_ENABLED=1 LCPU=arm64

else ifeq ($(BR2_x86_64),y)
LIBRETRO_MAME2010_EXTRA_ARGS += PTR64=1 ARM_ENABLED=0 LCPU=x86_64

else ifeq ($(BR2_x86_i686),y)
LIBRETRO_MAME2010_EXTRA_ARGS += PTR64=0 ARM_ENABLED=0 LCPU=x86

else ifeq ($(BR2_arm),y)
LIBRETRO_MAME2010_EXTRA_ARGS += PTR64=0 ARM_ENABLED=1 LCPU=arm

else ifeq ($(BR2_aarch64),y)
LIBRETRO_MAME2010_PLATFORM = unix
LIBRETRO_MAME2010_EXTRA_ARGS += PTR64=1 ARM_ENABLED=1 LCPU=arm64
endif

define LIBRETRO_MAME2010_BUILD_CMDS
	mkdir -p $(@D)/obj/mame/cpu/ccpu
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" LD="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_MAME2010_PLATFORM)" $(LIBRETRO_MAME2010_EXTRA_ARGS) \
		OPTIMIZE=s SYMBOLS=1 SYMLEVEL=1 STRIP_SYMBOLS=1 \
		GIT_VERSION="-$(shell echo $(LIBRETRO_MAME2010_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_MAME2010_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mame2010_libretro.so $(TARGET_DIR)/usr/lib/libretro/mame0139_libretro.so

	# Bios
	# Need to think of another way to use these files.
	# They take up a lot of space on tmpfs.
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/mame2010/samples
	find $(@D)/metadata -maxdepth 1 -iname "*.xml" -print0 | xargs -0 -I{} xz -9 {}
	find $(@D)/metadata -maxdepth 1 -iname "*.xml" -print0 | xargs -0 -I{} rm {}
	$(INSTALL) -D $(@D)/metadata/* $(TARGET_DIR)/usr/share/batocera/datainit/bios/mame2010
endef

$(eval $(generic-package))
