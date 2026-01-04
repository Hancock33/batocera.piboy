################################################################################
#
# libretro-fbneo
#
################################################################################
# Version: Commits on Jan 04, 2026
LIBRETRO_FBNEO_VERSION = 6f05f3900745190d9861305637580d615035a3b4
LIBRETRO_FBNEO_SITE = $(call github,libretro,FBNeo,$(LIBRETRO_FBNEO_VERSION))
LIBRETRO_FBNEO_LICENSE = Non-commercial
LIBRETRO_FBNEO_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_FBNEO_PLATFORM = unix-rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_FBNEO_PLATFORM = unix-rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_FBNEO_PLATFORM = unix-rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_FBNEO_PLATFORM = unix-rpi5_64
else
    LIBRETRO_FBNEO_PLATFORM = $(LIBRETRO_PLATFORM)
endif

ifeq ($(BR2_arm),y)
    LIBRETRO_FBNEO_EXTRA_ARGS += USE_CYCLONE=1
endif

ifeq ($(BR2_ARM_FPU_NEON_VFPV4)$(BR2_ARM_FPU_NEON)$(BR2_ARM_FPU_NEON_FP_ARMV8),y)
    LIBRETRO_FBNEO_EXTRA_ARGS += HAVE_NEON=1
else
    LIBRETRO_FBNEO_EXTRA_ARGS += HAVE_NEON=0
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86) $(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    LIBRETRO_FBNEO_EXTRA_ARGS += USE_X64_DRC=1 profile=accuracy
else
    LIBRETRO_FBNEO_EXTRA_ARGS += profile=performance
endif

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RK3326),y)
    LIBRETRO_FBNEO_EXTRA_ARGS += USE_EXPERIMENTAL_FLAGS=0
endif

define LIBRETRO_FBNEO_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/src/burner/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/burner/libretro -f Makefile platform="$(LIBRETRO_FBNEO_PLATFORM)" $(LIBRETRO_FBNEO_EXTRA_ARGS) \
		GIT_VERSION="$(shell echo $(LIBRETRO_FBNEO_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_FBNEO_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/src/burner/libretro/fbneo_libretro.so $(TARGET_DIR)/usr/lib/libretro/fbneo_libretro.so

	# Bios
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/fbneo/samples
	$(INSTALL) -D $(@D)/metadata/* $(TARGET_DIR)/usr/share/batocera/datainit/bios/fbneo

	# Need to think of another way to use these files.
	# They take up a lot of space on tmpfs.
	# --exclude light as those are for the n3ds build of fbneo, not used by Batocera at all
	find $(@D)/dats -maxdepth 1 -iname "*.dat" -print0 | xargs -0 -I{} xz -9 {}
	find $(@D)/dats -maxdepth 1 -iname "*.dat" -print0 | xargs -0 -I{} rm {}
	rsync -a $(@D)/dats/* $(TARGET_DIR)/usr/share/batocera/datainit/bios/fbneo --exclude light
endef

$(eval $(generic-package))
