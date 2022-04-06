################################################################################
#
# BOOM3 - Doom3 Engine
#
################################################################################
# Version: Commits on Apr 05, 2022
LIBRETRO_BOOM_VERSION = f271fa75b678eb4ff62a7f6e8945e94176d0d5f8
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
