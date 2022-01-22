################################################################################
#
# BOOM3 - Doom3 Engine
#
################################################################################
# Version.: Commits on Jan 21, 2022
LIBRETRO_BOOM_VERSION = 07d3d5b18514fe5ec55ce006aeb29c06a4ac55d9
LIBRETRO_BOOM3_SITE = $(call github,libretro,boom3,$(LIBRETRO_BOOM3_VERSION))
LIBRETRO_BOOM3_LICENSE = GPLv2

define LIBRETRO_BOOM3_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/neo -f Makefile platform=unix \
        GIT_VERSION="-$(shell echo $(LIBRETRO_BOOM3_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BOOM3_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/BOOM3_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/BOOM3_libretro.so
endef

$(eval $(generic-package))
