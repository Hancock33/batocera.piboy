################################################################################
#
# LIBRETRO_JAXE
#
################################################################################
# Version.: Commits on Jan 21, 2022
LIBRETRO_JAXE_VERSION = 32fd0c98c57a267590ac4e89b31c59605c8df867
LIBRETRO_JAXE_SITE = https://github.com/kurtjd/jaxe.git
LIBRETRO_JAXE_SITE_METHOD=git
LIBRETRO_JAXE_GIT_SUBMODULES=YES
LIBRETRO_JAXE_LICENSE = MIT

define LIBRETRO_JAXE_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_JAXE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/jaxe_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/jaxe_libretro.so
endef

$(eval $(generic-package))
