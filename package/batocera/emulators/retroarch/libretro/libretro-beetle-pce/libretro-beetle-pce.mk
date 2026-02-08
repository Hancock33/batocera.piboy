################################################################################
#
# libretro-beetle-pce
#
################################################################################
# Version: Commits on Jun 22, 2025
LIBRETRO_BEETLE_PCE_VERSION = 9a301c0773c53702a882bbaa42ee9cbc6d523787
LIBRETRO_BEETLE_PCE_SITE = $(call github,libretro,beetle-pce-libretro,$(LIBRETRO_BEETLE_PCE_VERSION))
LIBRETRO_BEETLE_PCE_LICENSE = GPLv2
LIBRETRO_BEETLE_PCE_DEPENDENCIES += retroarch
LIBRETRO_BEETLE_PCE_EMULATOR_INFO = pce.libretro.core.yml

define LIBRETRO_BEETLE_PCE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) platform="$(LIBRETRO_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_BEETLE_PCE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BEETLE_PCE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mednafen_pce_libretro.so $(TARGET_DIR)/usr/lib/libretro/pce_libretro.so
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
