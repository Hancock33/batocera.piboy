################################################################################
#
# libretro-beetle-ngp
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_BEETLE_NGP_VERSION = 139fe34c8dfc5585d6ee1793a7902bca79d544de
LIBRETRO_BEETLE_NGP_SITE = $(call github,libretro,beetle-ngp-libretro,$(LIBRETRO_BEETLE_NGP_VERSION))
LIBRETRO_BEETLE_NGP_LICENSE = GPLv2
LIBRETRO_BEETLE_NGP_DEPENDENCIES += retroarch
LIBRETRO_BEETLE_NGP_EMULATOR_INFO = mednafen_ngp.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_BEETLE_NGP_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_BEETLE_NGP_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_BEETLE_NGP_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_BEETLE_NGP_PLATFORM = rpi5
else
    LIBRETRO_BEETLE_NGP_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_BEETLE_NGP_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_BEETLE_NGP_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_BEETLE_NGP_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BEETLE_NGP_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mednafen_ngp_libretro.so $(TARGET_DIR)/usr/lib/libretro/mednafen_ngp_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))