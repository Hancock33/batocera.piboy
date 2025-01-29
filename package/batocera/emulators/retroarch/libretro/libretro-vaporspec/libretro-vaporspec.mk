################################################################################
#
# libretro-vaporspec
#
################################################################################
# Version: Commits on Jan 28, 2025
LIBRETRO_VAPORSPEC_VERSION = f720ded3c8492a38aa341e8a6d85ed52855bf210
LIBRETRO_VAPORSPEC_SITE = https://github.com/minkcv/vm.git
LIBRETRO_VAPORSPEC_SITE_METHOD=git
LIBRETRO_VAPORSPEC_GIT_SUBMODULES=YES

LIBRETRO_VAPORSPEC_LICENSE = MIT
LIBRETRO_VAPORSPEC_DEPENDENCIES = retroarch

define LIBRETRO_VAPORSPEC_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/machine/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/machine -f Makefile.libretro platform="unix"
endef

define LIBRETRO_VAPORSPEC_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/machine/vaporspec_libretro.so $(TARGET_DIR)/usr/lib/libretro/vaporspec_libretro.so
endef

$(eval $(generic-package))
