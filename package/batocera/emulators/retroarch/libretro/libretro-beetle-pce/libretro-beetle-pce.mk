################################################################################
#
# libretro-beetle-pce
#
################################################################################
# Version: Commits on Aug 25, 2023
LIBRETRO_BEETLE_PCE_VERSION = 924ea45387157ec61866574d36c21eeb8906d84e
LIBRETRO_BEETLE_PCE_SITE = $(call github,libretro,beetle-pce-libretro,$(LIBRETRO_BEETLE_PCE_VERSION))
LIBRETRO_BEETLE_PCE_LICENSE = GPLv2

define LIBRETRO_BEETLE_PCE_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) platform="$(LIBRETRO_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_BEETLE_PCE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BEETLE_PCE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mednafen_pce_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/pce_libretro.so
endef

$(eval $(generic-package))
