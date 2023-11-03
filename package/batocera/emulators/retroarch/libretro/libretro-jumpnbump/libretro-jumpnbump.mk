################################################################################
#
# libretro-jumpnbump
#
################################################################################
# Version: Commits on Nov 02, 2023
LIBRETRO_JUMPNBUMP_VERSION = 4e68831f5576075c45c147f86865812afb816139
LIBRETRO_JUMPNBUMP_SITE = $(call github,libretro,jumpnbump-libretro,$(LIBRETRO_JUMPNBUMP_VERSION))
LIBRETRO_JUMPNBUMP_LICENSE = GPL-2.0

define LIBRETRO_JUMPNBUMP_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_JUMPNBUMP_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/jumpnbump_libretro.so \
	$(TARGET_DIR)/usr/lib/libretro/jumpnbump_libretro.so
endef

$(eval $(generic-package))
