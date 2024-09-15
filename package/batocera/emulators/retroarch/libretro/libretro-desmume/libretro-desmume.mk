################################################################################
#
# libretro-desmume
#
################################################################################
# Version: Commits on Jan 11, 2024
LIBRETRO_DESMUME_VERSION = b518fec54b79f2f71a7536715efcdcd7f60638a8
LIBRETRO_DESMUME_SITE = $(call github,libretro,desmume,$(LIBRETRO_DESMUME_VERSION))
LIBRETRO_DESMUME_LICENSE = GPLv2
LIBRETRO_DESMUME_DEPENDENCIES = libpcap

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
LIBRETRO_DESMUME_DEPENDENCIES += libglvnd
endif

define LIBRETRO_DESMUME_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/desmume/src/frontend/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/desmume/src/frontend/libretro -f Makefile platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_DESMUME_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/desmume/src/frontend/libretro/desmume_libretro.so $(TARGET_DIR)/usr/lib/libretro/desmume_libretro.so
endef

$(eval $(generic-package))
