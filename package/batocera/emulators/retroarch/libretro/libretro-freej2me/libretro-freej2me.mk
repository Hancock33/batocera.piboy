################################################################################
#
# FREEJ2ME
#
################################################################################
# Version.: Commits on Dec 17, 2021
LIBRETRO_FREEJ2ME_VERSION = 83b1046b52fc5dc42eee7e1347d71d15a0bb9b90
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
