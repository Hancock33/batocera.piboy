################################################################################
#
# GONG
#
################################################################################
# Version.: Commits on Apr 19, 2021
LIBRETRO_GONG_VERSION = c33d6f32fc76b642297e1b827edbd8434fec027f
LIBRETRO_GONG_SITE = $(call github,libretro,gong,$(LIBRETRO_GONG_VERSION))
LIBRETRO_GONG_LICENSE = PD

define LIBRETRO_GONG_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_GONG_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/gong_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/gong_libretro.so
endef

$(eval $(generic-package))
