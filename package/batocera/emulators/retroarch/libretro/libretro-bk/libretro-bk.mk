################################################################################
#
# libretro-bk
#
################################################################################
# Version: Commits on Sept 04, 2026
LIBRETRO_BK_VERSION = 92042a753289cedf05e7e6bd8e75849f83e48966
LIBRETRO_BK_SITE = $(call github,libretro,bk-emulator,$(LIBRETRO_BK_VERSION))
LIBRETRO_BK_LICENSE = Custom
LIBRETRO_BK_EMULATOR_INFO = bk.libretro.core.yml

LIBRETRO_BK_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_BK_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro \
	platform="$(LIBRETRO_BK_PLATFORM)" GIT_VERSION="-$(shell echo $(LIBRETRO_BK_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BK_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/bk_libretro.so $(TARGET_DIR)/usr/lib/libretro/bk_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
