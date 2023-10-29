################################################################################
#
# libretro-freej2me
#
################################################################################
# Version: Commits on Oct 12, 2023
LIBRETRO_FREEJ2ME_VERSION = d8aa5d9a55a5673b77d5999342143ebdf131bfbd
LIBRETRO_FREEJ2ME_SITE = $(call github,hex007,freej2me,$(LIBRETRO_FREEJ2ME_VERSION))
LIBRETRO_FREEJ2ME_LICENSE = GPL-3.0

define LIBRETRO_FREEJ2ME_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/src/libretro/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/src/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/libretro/ -f Makefile platform="unix"
endef

define LIBRETRO_FREEJ2ME_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/libretro/freej2me_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/freej2me_libretro.so
endef

$(eval $(generic-package))
