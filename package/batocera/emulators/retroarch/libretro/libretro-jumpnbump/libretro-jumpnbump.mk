################################################################################
#
# Jump n' Bump
#
################################################################################
# Version.: Commits on Mar 14, 2022
LIBRETRO_JUMPNBUMP_VERSION = 896ef3f05ed356d4115db81f87bc494916b8185f
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
