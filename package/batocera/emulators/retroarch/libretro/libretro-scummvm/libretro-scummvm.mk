################################################################################
#
# libretro-scummvm
#
################################################################################
# Version: Commits on Mar 23, 2023
LIBRETRO_SCUMMVM_VERSION = 3c7b7b4a724271a539dae794513d41a06fdb517b
LIBRETRO_SCUMMVM_SOURCE = scummvm-$(LIBRETRO_SCUMMVM_VERSION).tar.gz
LIBRETRO_SCUMMVM_SITE = $(call github,scummvm,scummvm,$(LIBRETRO_SCUMMVM_VERSION))
LIBRETRO_SCUMMVM_LICENSE = GPLv2
LIBRETRO_SCUMMVM_DEPENDENCIES = sdl2 zlib jpeg libmpeg2 libogg libvorbis flac libmad libpng libtheora faad2 freetype

LIBRETRO_SCUMMVM_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_SCUMMVM_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_SCUMMVM_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_SCUMMVM_PLATFORM = rpi3_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_SCUMMVM_PLATFORM = rpi4_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
LIBRETRO_SCUMMVM_PLATFORM = armv cortexa9 neon hardfloat

else ifeq ($(BR2_aarch64),y)
LIBRETRO_SCUMMVM_PLATFORM = unix
LIBRETRO_SCUMMVM_MAKE_OPTS += TARGET_64BIT=1
endif

define LIBRETRO_SCUMMVM_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/backends/platform/libretro \
	platform="$(LIBRETRO_SCUMMVM_PLATFORM)" $(LIBRETRO_SCUMMVM_MAKE_OPTS) all
endef

define LIBRETRO_SCUMMVM_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/backends/platform/libretro/scummvm_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/scummvm_libretro.so

	$(INSTALL) -D $(@D)/backends/platform/libretro/scummvm_libretro.info \
		$(TARGET_DIR)/usr/share/libretro/info/scummvm_libretro.info	
endef

$(eval $(generic-package))
