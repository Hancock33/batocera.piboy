################################################################################
#
# SAMEBOY
#
################################################################################
# Version.: Commits on Dec 20, 2021
LIBRETRO_SAMEBOY_VERSION = b154b7d3d885a3cf31203f0b8f50d3b37c8b742b
LIBRETRO_SAMEBOY_SITE = $(call github,libretro,SameBoy,$(LIBRETRO_SAMEBOY_VERSION))
LIBRETRO_SAMEBOY_LICENSE = GPL

LIBRETRO_SAMEBOY_EXTRA_ARGS=
LIBRETRO_SAMEBOY_BOARD=

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_SAMEBOY_EXTRA_ARGS=ARCH=aarch64
LIBRETRO_SAMEBOY_PLATFORM=rpi4_64
else
LIBRETRO_SAMEBOY_PLATFORM=$(LIBRETRO_PLATFORM)
endif

define LIBRETRO_SAMEBOY_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro -f Makefile platform="$(LIBRETRO_SAMEBOY_PLATFORM)" \
		BOARD="$(LIBRETRO_SAMEBOY_BOARD)" $(LIBRETRO_SAMEBOY_EXTRA_ARGS)
endef

define LIBRETRO_SAMEBOY_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/libretro/sameboy_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/sameboy_libretro.so
endef

$(eval $(generic-package))
