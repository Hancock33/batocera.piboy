################################################################################
#
# libretro-openlara
#
################################################################################
# Version: Commits on Jul 29, 2022
LIBRETRO_OPENLARA_VERSION = 39ba32e43d958c32bf7779b350c348450b6e1e65
LIBRETRO_OPENLARA_SITE = $(call github,libretro,openlara,$(LIBRETRO_OPENLARA_VERSION))
LIBRETRO_OPENLARA_LICENSE = BSD 2
LIBRETRO_OPENLARA_LICENSE_FILES = LICENSE

LIBRETRO_OPENLARA_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_OPENLARA_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/platform/libretro/ -f Makefile platform="$(LIBRETRO_OPENLARA_PLATFORM)" GLES3=1
endef

define LIBRETRO_OPENLARA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/openlara_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/openlara_libretro.so
endef

$(eval $(generic-package))
