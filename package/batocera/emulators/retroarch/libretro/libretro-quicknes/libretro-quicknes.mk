################################################################################
#
# libretro-quicknes
#
################################################################################
# Version: Commits on Jun 28, 2024
LIBRETRO_QUICKNES_VERSION = 89d649a544e7d37a5cdbc77c811e88753fa23131
LIBRETRO_QUICKNES_SITE = $(call github,libretro,QuickNES_Core,$(LIBRETRO_QUICKNES_VERSION))
LIBRETRO_QUICKNES_LICENSE = GPL

define LIBRETRO_QUICKNES_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform=unix \
		GIT_VERSION="-$(shell echo $(LIBRETRO_QUICKNES_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_QUICKNES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/quicknes_libretro.so $(TARGET_DIR)/usr/lib/libretro/quicknes_libretro.so
endef

$(eval $(generic-package))
