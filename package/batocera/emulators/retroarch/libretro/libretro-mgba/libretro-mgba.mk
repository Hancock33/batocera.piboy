################################################################################
#
# libretro-mgba
#
################################################################################
# Version: Commits on Jan 26, 2023
LIBRETRO_MGBA_VERSION = a69c3434afe8b26cb8f9463077794edfa7d5efad
LIBRETRO_MGBA_SITE = $(call github,libretro,mgba,$(LIBRETRO_MGBA_VERSION))
LIBRETRO_MGBA_LICENSE = MPLv2.0

LIBRETRO_MGBA_DEPENDENCIES = libzip libpng zlib

define LIBRETRO_MGBA_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile \
        GIT_VERSION="-$(shell echo $(LIBRETRO_MGBA_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_MGBA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mgba_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/mgba_libretro.so
endef

$(eval $(generic-package))
