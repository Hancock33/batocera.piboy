################################################################################
#
# libretro-jaxe
#
################################################################################
# Version: Commits on Apr 16, 2025
LIBRETRO_JAXE_VERSION = 4825aad24716f67924cd949354aae490a14b4d2d
LIBRETRO_JAXE_SITE = https://github.com/kurtjd/jaxe.git
LIBRETRO_JAXE_SITE_METHOD=git
LIBRETRO_JAXE_GIT_SUBMODULES=YES
LIBRETRO_JAXE_LICENSE = MIT

define LIBRETRO_JAXE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_JAXE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/jaxe_libretro.so $(TARGET_DIR)/usr/lib/libretro/jaxe_libretro.so
endef

$(eval $(generic-package))
