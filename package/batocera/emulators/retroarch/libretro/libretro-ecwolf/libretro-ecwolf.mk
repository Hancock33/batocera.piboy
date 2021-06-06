################################################################################
#
# ECWOLF
#
################################################################################
# Version.: Commits on Apr 30, 2021
LIBRETRO_ECWOLF_VERSION = fe041979e5e51b2ca0c90bb40ea6acf79714c3c7
LIBRETRO_ECWOLF_SITE = $(call github,libretro,ecwolf,$(LIBRETRO_ECWOLF_VERSION))
LIBRETRO_ECWOLF_LICENSE = GPL-2.0, ID-Software, MAME
LIBRETRO_ECWOLF_LICENSE_FILES = docs/license-gpl.txt docs/license-id.txt docs/license-mame.txt
LIBRETRO_ECWOLF_NON_COMMERCIAL = y

LIBRETRO_ECWOLF_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_ECWOLF_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/libretro -f Makefile platform="$(LIBRETRO_ECWOLF_PLATFORM)"
endef

define LIBRETRO_ECWOLF_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/libretro/ecwolf_libretro.so \
	$(TARGET_DIR)/usr/lib/libretro/ecwolf_libretro.so
endef

$(eval $(generic-package))
