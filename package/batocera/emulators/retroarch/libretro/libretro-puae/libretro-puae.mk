################################################################################
#
# PUAE
#
################################################################################
# Version.: Commits on Oct 11, 2021
LIBRETRO_PUAE_VERSION = a228c99aa75b7d19a0c3926e28fb4066d9d1987e
LIBRETRO_PUAE_SITE = $(call github,libretro,libretro-uae,$(LIBRETRO_PUAE_VERSION))
LIBRETRO_PUAE__LICENSE = GPLv2

PUAEPLATFORM=$(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
PUAEPLATFORM=rpi
endif

define LIBRETRO_PUAE_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(PUAEPLATFORM)"
endef

define LIBRETRO_PUAE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/puae_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/puae_libretro.so
endef

$(eval $(generic-package))
