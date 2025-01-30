################################################################################
#
# libretro-puae2021
#
################################################################################
# Version: Commits on Jan 30, 2025
LIBRETRO_PUAE2021_VERSION = ba6b96b9b0d179fa77696cd5bb88dd7efa25aa54
LIBRETRO_PUAE2021_BRANCH = 2.6.1
LIBRETRO_PUAE2021_SITE = $(call github,sonninnos,libretro-uae,$(LIBRETRO_PUAE2021_VERSION))
LIBRETRO_PUAE2021_LICENSE = GPLv2
LIBRETRO_PUAE2021_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_PUAE2021_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
    LIBRETRO_PUAE2021_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_PUAE2021_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_PUAE2021_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
    LIBRETRO_PUAE2021_PLATFORM = rpi5
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    LIBRETRO_PUAE2021_PLATFORM = unix
else
    LIBRETRO_PUAE2021_PLATFORM=$(LIBRETRO_PLATFORM)
endif

define LIBRETRO_PUAE2021_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION) -Wno-implicit-function-declaration|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_PUAE2021_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_PUAE2021_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_PUAE2021_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/puae2021_libretro.so $(TARGET_DIR)/usr/lib/libretro/puae2021_libretro.so
endef

$(eval $(generic-package))
