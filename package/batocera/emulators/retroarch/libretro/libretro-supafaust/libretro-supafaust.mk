################################################################################
#
# libretro-supafaust
#
################################################################################
# Version: Commits on Jun 19, 2023
LIBRETRO_SUPAFAUST_VERSION = 6b639c98372d1c9bac885c55d772c812d2a9d525
LIBRETRO_SUPAFAUST_SITE = $(call github,libretro,supafaust,$(LIBRETRO_SUPAFAUST_VERSION))
LIBRETRO_SUPAFAUST_LICENSE = GPL

LIBRETRO_SUPAFAUST_EXTRA_ARGS=
LIBRETRO_SUPAFAUST_BOARD=

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
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_SUPAFAUST_PLATFORM)" \
		BOARD="$(LIBRETRO_SUPAFAUST_BOARD)" $(LIBRETRO_SUPAFAUST_EXTRA_ARGS)
endef

define LIBRETRO_SUPAFAUST_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mednafen_supafaust_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/supafaust_libretro.so
endef

$(eval $(generic-package))
