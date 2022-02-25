################################################################################
#
# MESEN
#
################################################################################
# Version.: Commits on Feb 24, 2022
LIBRETRO_MESEN_VERSION = 7376e98b8b3a6ef4c9e5c8dd34b65554d322019c
LIBRETRO_MESEN_SITE = $(call github,libretro,Mesen,$(LIBRETRO_MESEN_VERSION))
LIBRETRO_MESEN_LICENSE = GPL

LIBRETRO_MESEN_EXTRA_ARGS=
LIBRETRO_MESEN_BOARD=

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_MESEN_EXTRA_ARGS=ARCH=aarch64
LIBRETRO_MESEN_PLATFORM=rpi4_64
else
LIBRETRO_MESEN_PLATFORM=$(LIBRETRO_PLATFORM)
endif

define LIBRETRO_MESEN_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/Libretro -f Makefile platform="$(LIBRETRO_MESEN_PLATFORM)" \
		BOARD="$(LIBRETRO_MESEN_BOARD)" $(LIBRETRO_MESEN_EXTRA_ARGS)
endef

define LIBRETRO_MESEN_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/Libretro/mesen_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mesen_libretro.so
endef

$(eval $(generic-package))
