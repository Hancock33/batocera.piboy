################################################################################
#
# LIBRETRO_BEETLE_PSX
#
################################################################################
# Version.: Commits on Oct 09, 2021
LIBRETRO_BEETLE_PSX_VERSION = 8b91df4d9937aa877d3b197f41fc2bad193dfd6f
LIBRETRO_BEETLE_PSX_SITE = $(call github,libretro,beetle-psx-libretro,$(LIBRETRO_BEETLE_PSX_VERSION))
LIBRETRO_BEETLE_PSX_LICENSE = GPLv2

LIBRETRO_BEETLE_PSX_FAST_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_BEETLE_PSX_FAST_PLATFORM = rpi4_64
endif

LIBRETRO_BEETLE_PSX_EXTRAOPT=
LIBRETRO_BEETLE_PSX_OUTFILE=mednafen_psx_libretro.so

ifeq ($(BR2_PACKAGE_XORG7),y)
LIBRETRO_BEETLE_PSX_EXTRAOPT += HAVE_HW=1
LIBRETRO_BEETLE_PSX_OUTFILE=mednafen_psx_hw_libretro.so
endif

define LIBRETRO_BEETLE_PSX_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile $(LIBRETRO_BEETLE_PSX_EXTRAOPT) platform="$(LIBRETRO_BEETLE_PSX_FAST_PLATFORM)"
endef

define LIBRETRO_BEETLE_PSX_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/$(LIBRETRO_BEETLE_PSX_OUTFILE) \
		$(TARGET_DIR)/usr/lib/libretro/mednafen_psx_libretro.so
endef

$(eval $(generic-package))
