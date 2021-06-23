################################################################################
#
# CHAILOVE
#
################################################################################
# Version.: Commits on Mar 08, 2021
LIBRETRO_CHAILOVE_VERSION = 51caa9a8be34bfe9c68e9a3dd7fbbe81d832bc2a
LIBRETRO_CHAILOVE_SITE = https://github.com/libretro/libretro-chailove.git

LIBRETRO_CHAILOVE_SITE_METHOD=git
LIBRETRO_CHAILOVE_GIT_SUBMODULES=YES
LIBRETRO_CHAILOVE_LICENSE = MIT

define LIBRETRO_CHAILOVE_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="unix"
endef

define LIBRETRO_CHAILOVE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/chailove_libretro.so \
    $(TARGET_DIR)/usr/lib/libretro/chailove_libretro.so
endef

$(eval $(generic-package))
