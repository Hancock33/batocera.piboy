################################################################################
#
# libretro-bsnes-jg
#
################################################################################
# Version: Commits on Jan 15, 2025
LIBRETRO_BSNES_JG_VERSION = bdfb426b8d729050fe6f915670ce12bce9b7a42f
LIBRETRO_BSNES_JG_SITE = $(call github,libretro,bsnes-jg,$(LIBRETRO_BSNES_JG_VERSION))
LIBRETRO_BSNES_JG_LICENSE = GPL-3.0

define LIBRETRO_BSNES_JG_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro -f Makefile platform="unix" \
	GIT_VERSION="-$(shell echo $(LIBRETRO_BSNES_JG_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BSNES_JG_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libretro/bsnes-jg_libretro.so $(TARGET_DIR)/usr/lib/libretro/bsnes-jg_libretro.so
endef

$(eval $(generic-package))
