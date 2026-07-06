################################################################################
#
# libretro-quicknes
#
################################################################################
# Version: Commits on Jul 06, 2026
LIBRETRO_QUICKNES_VERSION = 26bb785c9deddb66a17717b21bb4e328f03ade32
LIBRETRO_QUICKNES_SITE = $(call github,libretro,QuickNES_Core,$(LIBRETRO_QUICKNES_VERSION))
LIBRETRO_QUICKNES_LICENSE = GPL
LIBRETRO_QUICKNES_EMULATOR_INFO = quicknes.libretro.core.yml

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
$(eval $(emulator-info-package))
