################################################################################
#
# DINOTHAWR
#
################################################################################
# Version.: Commits on Nov 02, 2021
LIBRETRO_DINOTHAWR_VERSION = 2e789028a8738ecfbde4da6dc164c41502a94955
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
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/dinothawr/dinothawr
	cp -R $(@D)/dinothawr/* $(TARGET_DIR)/usr/share/batocera/datainit/roms/dinothawr/dinothawr
endef

$(eval $(generic-package))
