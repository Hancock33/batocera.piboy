################################################################################
#
# libretro-dinothawr
#
################################################################################
# Version: Commits on Apr 20, 2026
LIBRETRO_DINOTHAWR_VERSION = fbf022d21ce3b226225e434c8686944cf4ac0f82
LIBRETRO_DINOTHAWR_SITE = $(call github,libretro,Dinothawr,$(LIBRETRO_DINOTHAWR_VERSION))
LIBRETRO_DINOTHAWR_LICENSE = Custom
LIBRETRO_DINOTHAWR_LICENSE_FILES = LICENSE
LIBRETRO_DINOTHAWR_NON_COMMERCIAL = y
LIBRETRO_DINOTHAWR_DEPENDENCIES = retroarch
LIBRETRO_DINOTHAWR_EMULATOR_INFO = dinothawr.libretro.core.yml

define LIBRETRO_DINOTHAWR_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_DINOTHAWR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/dinothawr_libretro.so $(TARGET_DIR)/usr/lib/libretro/dinothawr_libretro.so
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/dinothawr/dinothawr
	cp -R $(@D)/dinothawr/* $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/dinothawr/dinothawr
endef

$(eval $(generic-package))
$(eval $(emulator-info-package))
