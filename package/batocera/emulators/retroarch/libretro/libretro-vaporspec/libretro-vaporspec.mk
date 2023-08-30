################################################################################
#
# libretro-vaporspec
#
################################################################################
# Version: Commits on Jun 10, 2023
LIBRETRO_VAPORSPEC_VERSION = fb5d6ddabec23298db39ab8536f77623fb3a1bae
LIBRETRO_VAPORSPEC_SITE = https://github.com/minkcv/vm.git
LIBRETRO_VAPORSPEC_SITE_METHOD=git
LIBRETRO_VAPORSPEC_GIT_SUBMODULES=YES

LIBRETRO_VAPORSPEC_LICENSE = MIT
LIBRETRO_VAPORSPEC_DEPENDENCIES = retroarch

define LIBRETRO_VAPORSPEC_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/machine/Makefile.libretro
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/machine/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/machine -f Makefile.libretro platform="unix"
endef

define LIBRETRO_VAPORSPEC_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/machine/vaporspec_libretro.so \
	    $(TARGET_DIR)/usr/lib/libretro/vaporspec_libretro.so
endef

$(eval $(generic-package))
