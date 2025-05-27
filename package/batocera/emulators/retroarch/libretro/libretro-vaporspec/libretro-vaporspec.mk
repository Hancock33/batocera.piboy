################################################################################
#
# libretro-vaporspec
#
################################################################################
# Version: Commits on May 25, 2025
LIBRETRO_VAPORSPEC_VERSION = f048f7bd52748bc14e9d065b4a5eb6a54c714b90
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
