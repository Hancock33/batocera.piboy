################################################################################
#
# libretro-sameboy
#
################################################################################
# Version: Commits on Aug 19, 2022
LIBRETRO_SAMEBOY_VERSION = 09138330990da32362246c7034cf4de2ea0a2a2b
LIBRETRO_SAMEBOY_SITE = $(call github,libretro,SameBoy,$(LIBRETRO_SAMEBOY_VERSION))
LIBRETRO_SAMEBOY_LICENSE = GPL

LIBRETRO_SAMEBOY_EXTRA_ARGS=
LIBRETRO_SAMEBOY_BOARD=

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_SAMEBOY_EXTRA_ARGS=ARCH=aarch64
LIBRETRO_SAMEBOY_PLATFORM=rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_SAMEBOY_EXTRA_ARGS=ARCH=aarch64
LIBRETRO_SAMEBOY_PLATFORM=unix
else
LIBRETRO_SAMEBOY_PLATFORM=$(LIBRETRO_PLATFORM)
endif

define LIBRETRO_SAMEBOY_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro -f Makefile platform="$(LIBRETRO_SAMEBOY_PLATFORM)" \
		BOARD="$(LIBRETRO_SAMEBOY_BOARD)" $(LIBRETRO_SAMEBOY_EXTRA_ARGS)
endef

define LIBRETRO_SAMEBOY_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/libretro/sameboy_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/sameboy_libretro.so
endef

$(eval $(generic-package))
