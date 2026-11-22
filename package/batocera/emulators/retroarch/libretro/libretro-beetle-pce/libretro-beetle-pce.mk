################################################################################
#
# libretro-beetle-pce
#
################################################################################
# Version: Commits on Nov 22, 2026
LIBRETRO_BEETLE_PCE_VERSION = 974fe085a9842be2069afc95beaf469a90e9ae44
LIBRETRO_BEETLE_PCE_SITE = $(call github,libretro,beetle-pce-libretro,$(LIBRETRO_BEETLE_PCE_VERSION))
LIBRETRO_BEETLE_PCE_LICENSE = GPL-2.0
LIBRETRO_BEETLE_PCE_DEPENDENCIES += retroarch
LIBRETRO_BEETLE_PCE_EMULATOR_INFO = pce.libretro.core.yml

define LIBRETRO_BEETLE_PCE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) platform="$(LIBRETRO_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_BEETLE_PCE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BEETLE_PCE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mednafen_pce_libretro.so $(TARGET_DIR)/usr/lib/libretro/pce_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
