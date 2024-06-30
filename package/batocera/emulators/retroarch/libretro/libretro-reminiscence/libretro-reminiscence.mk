################################################################################
#
# libretro-reminiscence
#
################################################################################
# Version: Commits on Jun 28, 2024
LIBRETRO_REMINISCENCE_VERSION = b7c3ff91ada2e49fa5ee5af2b139e6cc0ce6bf24
LIBRETRO_REMINISCENCE_SITE = $(call github,libretro,REminiscence,$(LIBRETRO_REMINISCENCE_VERSION))
LIBRETRO_REMINISCENCE_LICENSE = GPL-3.0

LIBRETRO_REMINISCENCE_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_REMINISCENCE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform=unix
endef

define LIBRETRO_REMINISCENCE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/reminiscence_libretro.so $(TARGET_DIR)/usr/lib/libretro/reminiscence_libretro.so
endef

$(eval $(generic-package))
