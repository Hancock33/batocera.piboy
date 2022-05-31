################################################################################
#
# LIBRETRO_VAPORSPEC
#
################################################################################
# Version: Commits on May 31, 2022
LIBRETRO_VAPORSPEC_VERSION = 9800fee5f0578f1c5e493b5faa66141f9bd50bcb
LIBRETRO_VAPORSPEC_SITE = https://github.com/minkcv/vm.git
LIBRETRO_VAPORSPEC_SITE_METHOD=git
LIBRETRO_VAPORSPEC_GIT_SUBMODULES=YES

LIBRETRO_VAPORSPEC_LICENSE = MIT
LIBRETRO_VAPORSPEC_DEPENDENCIES = retroarch

define LIBRETRO_VAPORSPEC_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/machine -f Makefile.libretro platform="unix"
endef

define LIBRETRO_VAPORSPEC_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/machine/vaporspec_libretro.so \
	    $(TARGET_DIR)/usr/lib/libretro/vaporspec_libretro.so
endef

$(eval $(generic-package))
