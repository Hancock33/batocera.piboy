################################################################################
#
# OPENLARA
#
################################################################################
# Version: Commits on Jan 21, 2021
LIBRETRO_OPENLARA_VERSION = fe88d74673344afc71891717b2474d33f90c165f
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
