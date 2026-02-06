################################################################################
#
# libretro-bk-emulator
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_BK_EMULATOR_VERSION = f95d929c8eca6c85075cd5c56a08aac9c58f3802
LIBRETRO_BK_EMULATOR_SITE = $(call github,libretro,bk-emulator,$(LIBRETRO_BK_EMULATOR_VERSION))
LIBRETRO_BK_EMULATOR_LICENSE = Custom
LIBRETRO_BK_EMULATOR_INFO = bk.libretro.core.yml

LIBRETRO_BK_EMULATOR_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_BK_EMULATOR_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro \
	platform="$(LIBRETRO_BK_EMULATOR_PLATFORM)" GIT_VERSION="-$(shell echo $(LIBRETRO_BK_EMULATOR_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BK_EMULATOR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/bk_libretro.so $(TARGET_DIR)/usr/lib/libretro/bk_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
