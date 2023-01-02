################################################################################
#
# libretro-openlara
#
################################################################################
# Version: Commits on Nov 16, 2022
LIBRETRO_OPENLARA_VERSION = 96989ac41ae55a42b19916dc8191f74be40e1b07
LIBRETRO_OPENLARA_SITE = $(call github,libretro,openlara,$(LIBRETRO_OPENLARA_VERSION))
LIBRETRO_OPENLARA_LICENSE = BSD 2
LIBRETRO_OPENLARA_LICENSE_FILES = LICENSE

LIBRETRO_OPENLARA_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_OPENLARA_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/src/platform/libretro/ -f Makefile platform="unix"
endef

define LIBRETRO_OPENLARA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/platform/libretro/openlara_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/openlara_libretro.so
endef

$(eval $(generic-package))
