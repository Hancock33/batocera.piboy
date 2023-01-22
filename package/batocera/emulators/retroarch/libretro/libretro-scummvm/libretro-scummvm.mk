################################################################################
#
# libretro-scummvm
#
################################################################################
# Version: Commits on Jan 21, 2023 (branch@2.7.0-git)
LIBRETRO_SCUMMVM_VERSION = 9a389362784f979fdaef5b786b3d72b7a2b935e2
LIBRETRO_SCUMMVM_SITE = https://github.com/libretro/scummvm
LIBRETRO_SCUMMVM_SITE_METHOD=git
LIBRETRO_SCUMMVM_GIT_SUBMODULES=YES
LIBRETRO_SCUMMVM_LICENSE = GPLv3

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
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ platform="$(LIBRETRO_SCUMMVM_PLATFORM)" $(LIBRETRO_SCUMMVM_MAKE_OPTS)
endef

define LIBRETRO_SCUMMVM_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/scummvm_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/scummvm_libretro.so
endef

$(eval $(generic-package))
