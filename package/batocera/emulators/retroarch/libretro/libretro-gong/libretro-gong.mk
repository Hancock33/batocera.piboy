################################################################################
#
# GONG
#
################################################################################
# Version.: Commits on Mar 16, 2022
LIBRETRO_GONG_VERSION = baf4eb8e086d0555d977bdfa2250776cb066afe9
LIBRETRO_GONG_SITE = $(call github,libretro,gong,$(LIBRETRO_GONG_VERSION))
LIBRETRO_GONG_LICENSE = GPLv3

define LIBRETRO_GONG_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_GONG_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/gong_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/gong_libretro.so
endef

$(eval $(generic-package))
