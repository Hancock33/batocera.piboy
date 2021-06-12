################################################################################
#
# DINOTHAWR
#
################################################################################
# Version.: Commits on Apr 09, 2021
LIBRETRO_DINOTHAWR_VERSION = 90264f4de875407212ada474761097de7a45fa53
LIBRETRO_DINOTHAWR_SITE = $(call github,libretro,Dinothawr,$(LIBRETRO_DINOTHAWR_VERSION))
LIBRETRO_DINOTHAWR_LICENSE = Custom
LIBRETRO_DINOTHAWR_LICENSE_FILES = LICENSE
LIBRETRO_DINOTHAWR_NON_COMMERCIAL = y

define LIBRETRO_DINOTHAWR_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_DINOTHAWR_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/dinothawr_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/dinothawr_libretro.so
	mkdir -p $(TARGET_DIR)/recalbox/share_init/roms/ports/Dinothawr/dinothawr
	cp -R $(@D)/dinothawr/* $(TARGET_DIR)/recalbox/share_init/roms/ports/Dinothawr/dinothawr
endef

$(eval $(generic-package))
