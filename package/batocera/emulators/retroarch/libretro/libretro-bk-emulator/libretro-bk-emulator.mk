################################################################################
#
# libretro-bk-emulator
#
################################################################################
# Version: Commits on Apr 20, 2026
LIBRETRO_BK_EMULATOR_VERSION = fe64da42ee463c1b2f4d0566e4d0f7a9667506f6
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
