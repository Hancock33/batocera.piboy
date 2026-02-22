################################################################################
#
# libretro-beetle-vb
#
################################################################################
# Version: Commits on Feb 19, 2026
LIBRETRO_BEETLE_VB_VERSION = 65debc7c4c7b85e2fd988d2be53496c2cf0b5f44
LIBRETRO_BEETLE_VB_SITE = $(call github,libretro,beetle-vb-libretro,$(LIBRETRO_BEETLE_VB_VERSION))
LIBRETRO_BEETLE_VB_LICENSE = GPLv2
LIBRETRO_BEETLE_VB_DEPENDENCIES += retroarch
LIBRETRO_BEETLE_VB_EMULATOR_INFO = vb.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_BEETLE_VB_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_BEETLE_VB_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_BEETLE_VB_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_BEETLE_VB_PLATFORM = rpi5_64
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_BEETLE_VB_PLATFORM = unix
else
    LIBRETRO_BEETLE_VB_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_BEETLE_VB_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) platform="$(LIBRETRO_BEETLE_VB_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_BEETLE_VB_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BEETLE_VB_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mednafen_vb_libretro.so $(TARGET_DIR)/usr/lib/libretro/vb_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
