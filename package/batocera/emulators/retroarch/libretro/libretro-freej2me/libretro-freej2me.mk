################################################################################
#
# FREEJ2ME
#
################################################################################
# Version.: Commits on Dec 09, 2021
LIBRETRO_FREEJ2ME_VERSION = cce8347047159a29f44f2c5a9ec0e9ac78609d51
LIBRETRO_FREEJ2ME_SITE = $(call github,hex007,freej2me,$(LIBRETRO_FREEJ2ME_VERSION))
LIBRETRO_FREEJ2ME_LICENSE = GPL-3.0

define LIBRETRO_FREEJ2ME_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/libretro/ -f Makefile platform="unix"
endef

define LIBRETRO_FREEJ2ME_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/libretro/freej2me_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/freej2me_libretro.so
endef

$(eval $(generic-package))
