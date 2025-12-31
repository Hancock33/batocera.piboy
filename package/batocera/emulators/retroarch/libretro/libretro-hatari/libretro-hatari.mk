################################################################################
#
# libretro-hatari
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_HATARI_VERSION = 7008194d3f951a157997f67a820578f56f7feee0
LIBRETRO_HATARI_SITE = $(call github,libretro,hatari,$(LIBRETRO_HATARI_VERSION))
LIBRETRO_HATARI_DEPENDENCIES = libcapsimage zlib retroarch
LIBRETRO_HATARI_LICENSE = GPLv2

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_HATARI_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_HATARI_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_HATARI_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_HATARI_PLATFORM = rpi5
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_HATARI_PLATFORM = armv
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_HATARI_PLATFORM = unix
else
    LIBRETRO_HATARI_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_HATARI_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_HATARI_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_HATARI_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_HATARI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/hatari_libretro.so $(TARGET_DIR)/usr/lib/libretro/hatari_libretro.so
endef

$(eval $(generic-package))
