################################################################################
#
# libretro-gong
#
################################################################################
# Version: Commits on Apr 22, 2022
LIBRETRO_GONG_VERSION = 4dbe23494173b93322d1033da54aa36cb2b23be7
LIBRETRO_GONG_SITE = $(call github,libretro,gong,$(LIBRETRO_GONG_VERSION))
LIBRETRO_GONG_LICENSE = GPLv3

define LIBRETRO_GONG_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	-C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_GONG_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/gong_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/gong_libretro.so
endef

$(eval $(generic-package))
