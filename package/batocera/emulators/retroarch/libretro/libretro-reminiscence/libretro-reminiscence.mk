################################################################################
#
# REMINISCENCE
#
################################################################################
# Version.: Commits on Sep 23, 2021
LIBRETRO_REMINISCENCE_VERSION = e383043cde819a40d975b7839394487afc1003f2
LIBRETRO_REMINISCENCE_SITE = $(call github,libretro,REminiscence,$(LIBRETRO_REMINISCENCE_VERSION))
LIBRETRO_REMINISCENCE_LICENSE = GPL-3.0

LIBRETRO_REMINISCENCE_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_REMINISCENCE_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_REMINISCENCE_PLATFORM)"
endef

define LIBRETRO_REMINISCENCE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/reminiscence_libretro.so \
	$(TARGET_DIR)/usr/lib/libretro/reminiscence_libretro.so
endef

$(eval $(generic-package))
