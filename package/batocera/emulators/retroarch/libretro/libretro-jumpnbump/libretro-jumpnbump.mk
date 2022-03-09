################################################################################
#
# Jump n' Bump
#
################################################################################
# Version.: Commits on Mar 08, 2022
LIBRETRO_JUMPNBUMP_VERSION = c55c379b7fc7a4ba88ad8a249d938fe79791c903
LIBRETRO_JUMPNBUMP_SITE = $(call github,libretro,jumpnbump-libretro,$(LIBRETRO_JUMPNBUMP_VERSION))
LIBRETRO_JUMPNBUMP_LICENSE = GPL-2.0

define LIBRETRO_JUMPNBUMP_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_JUMPNBUMP_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/jumpnbump_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/jumpnbump_libretro.so
endef

$(eval $(generic-package))
