################################################################################
#
# libretro-puae
#
################################################################################
# Version: Commits on Jan 24, 2025
LIBRETRO_PUAE_VERSION = cf4f972d4b9d1cd6192bf84ea722d898daa09eed
LIBRETRO_PUAE_SITE = $(call github,sonninnos,libretro-uae,$(LIBRETRO_PUAE_VERSION))
LIBRETRO_PUAE__LICENSE = GPLv2

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_PUAE_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_PUAE_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_PUAE_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_PUAE_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_PUAE_PLATFORM = rpi5
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    LIBRETRO_PUAE_PLATFORM = unix
else
    LIBRETRO_PUAE_PLATFORM=$(LIBRETRO_PLATFORM)
endif

define LIBRETRO_PUAE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-implicit-function-declaration|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_PUAE_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_PUAE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_PUAE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/puae_libretro.so $(TARGET_DIR)/usr/lib/libretro/puae_libretro.so
endef

$(eval $(generic-package))
