################################################################################
#
# libretro-beetle-psx
#
################################################################################
# Version: Commits on Dec 02, 2022
LIBRETRO_BEETLE_PSX_VERSION = a87d6f3ed5d467f62179c2be63559b7025d2471d
LIBRETRO_BEETLE_PSX_SITE = $(call github,libretro,beetle-psx-libretro,$(LIBRETRO_BEETLE_PSX_VERSION))
LIBRETRO_BEETLE_PSX_LICENSE = GPLv2

LIBRETRO_BEETLE_PSX_EXTRAOPT=
LIBRETRO_BEETLE_PSX_OUTFILE=mednafen_psx_libretro.so

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
# Batocera - SBC required_hw_api = "OpenGL Core >= 3.3 | Vulkan >= 1.0"
  ifneq ($(BR2_PACKAGE_BATOCERA_SBC_XORG)$(BR2_PACKAGE_XWAYLAND),y)
    LIBRETRO_BEETLE_PSX_EXTRAOPT += HAVE_HW=1
    LIBRETRO_BEETLE_PSX_OUTFILE=mednafen_psx_hw_libretro.so
  endif
endif

define LIBRETRO_BEETLE_PSX_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile $(LIBRETRO_BEETLE_PSX_EXTRAOPT) platform="$(LIBRETRO_PLATFORM)" \
        GIT_VERSION="-$(shell echo $(LIBRETRO_BEETLE_PSX_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BEETLE_PSX_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/$(LIBRETRO_BEETLE_PSX_OUTFILE) \
		$(TARGET_DIR)/usr/lib/libretro/mednafen_psx_libretro.so
endef

$(eval $(generic-package))
