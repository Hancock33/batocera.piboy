################################################################################
#
# libretro-supafaust
#
################################################################################
# Version: Commits on Oct 01, 2024
LIBRETRO_SUPAFAUST_VERSION = e25f66765938d33f9ad5850e8d6cd597e55b7299
LIBRETRO_SUPAFAUST_SITE = $(call github,libretro,supafaust,$(LIBRETRO_SUPAFAUST_VERSION))
LIBRETRO_SUPAFAUST_LICENSE = GPL
LIBRETRO_SUPAFAUST_EMULATOR_INFO = supafaust.libretro.core.yml

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_SUPAFAUST_EXTRA_ARGS=ARCH=aarch64
    LIBRETRO_SUPAFAUST_PLATFORM=rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
    LIBRETRO_SUPAFAUST_EXTRA_ARGS=ARCH=aarch64
    LIBRETRO_SUPAFAUST_PLATFORM=unix
else
    LIBRETRO_SUPAFAUST_PLATFORM=$(LIBRETRO_PLATFORM)
endif

define LIBRETRO_SUPAFAUST_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_SUPAFAUST_PLATFORM)" \
	$(LIBRETRO_SUPAFAUST_EXTRA_ARGS) GIT_VERSION="-$(shell echo $(LIBRETRO_SUPAFAUST_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_SUPAFAUST_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mednafen_supafaust_libretro.so $(TARGET_DIR)/usr/lib/libretro/supafaust_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
