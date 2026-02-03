################################################################################
#
# libretro-reminiscence
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_REMINISCENCE_VERSION = e80d7b1aa287010e30c54f72252a9303173f1c7e
LIBRETRO_REMINISCENCE_SITE = $(call github,libretro,REminiscence,$(LIBRETRO_REMINISCENCE_VERSION))
LIBRETRO_REMINISCENCE_LICENSE = GPL-3.0
LIBRETRO_REMINISCENCE_DEPENDENCIES += retroarch
LIBRETRO_REMINISCENCE_EMULATOR_INFO = reminiscence.libretro.core.yml

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
$(eval $(emulator-info-package))