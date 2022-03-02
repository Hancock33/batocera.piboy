################################################################################
#
# Super Bros War
#
################################################################################
# Version.: Commits on Mar 02, 2022
LIBRETRO_SUPERBROSWAR_VERSION = c96d1398af4d1fdd73c3c358060c1b88988adbe2
LIBRETRO_SUPERBROSWAR_SITE = https://github.com/libretro/superbroswar-libretro.git
LIBRETRO_SUPERBROSWAR_SITE_METHOD=git
LIBRETRO_SUPERBROSWAR_GIT_SUBMODULES=YES
LIBRETRO_SUPERBROSWAR_LICENSE = GPL-2.0

define LIBRETRO_SUPERBROSWAR_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_SUPERBROSWAR_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/superbroswar_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/superbroswar_libretro.so
endef

$(eval $(generic-package))
