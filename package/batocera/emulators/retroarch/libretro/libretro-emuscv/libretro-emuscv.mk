################################################################################
#
# libretro-emuscv
#
################################################################################
# Version: Commits on Oct 18, 2022
LIBRETRO_EMUSCV_VERSION = dfce10df090ce3f5eb23bdbee289702ec1478246
LIBRETRO_EMUSCV_SITE = $(call gitlab,MaaaX-EmuSCV,libretro-emuscv,$(LIBRETRO_EMUSCV_VERSION))
LIBRETRO_EMUSCV_LICENSE = GPLv2
LIBRETRO_EMUSCV_DEPENDENCIES = sdl2

LIBRETRO_EMUSCV_PLATFORM = $(LIBRETRO_PLATFORM)
LIBRETRO_EMUSCV_EXTRA_ARGS =

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_EMUSCV_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_EMUSCV_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_EMUSCV_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_EMUSCV_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_EMUSCV_PLATFORM = rpi5
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
LIBRETRO_EMUSCV_PLATFORM = armv cortexa9 neon hardfloat
else ifeq ($(BR2_aarch64),y)
LIBRETRO_EMUSCV_PLATFORM = unix
LIBRETRO_EMUSCV_EXTRA_ARGS += ARCH=arm64
endif

ifeq ($(BR2_x86_64),y)
	LIBRETRO_EMUSCV_EXTRA_ARGS += ARCH=x86_64
endif

define LIBRETRO_EMUSCV_FIXSDL2_PATH
	$(SED) "s+\`sdl2-config+\`$(STAGING_DIR)/usr/bin/sdl2-config+g" $(@D)/Makefile.libretro
endef

LIBRETRO_EMUSCV_PRE_CONFIGURE_HOOKS += LIBRETRO_EMUSCV_FIXSDL2_PATH

define LIBRETRO_EMUSCV_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_EMUSCV_PLATFORM)" $(LIBRETRO_EMUSCV_EXTRA_ARGS)
endef

define LIBRETRO_EMUSCV_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/emuscv_libretro.so $(TARGET_DIR)/usr/lib/libretro/emuscv_libretro.so
endef

$(eval $(generic-package))
