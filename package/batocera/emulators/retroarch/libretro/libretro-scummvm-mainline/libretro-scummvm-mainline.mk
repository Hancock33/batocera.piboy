################################################################################
#
# libretro-scummvm-mainline
#
################################################################################
# Version: Commits on Dec 20, 2022
LIBRETRO_SCUMMVM_MAINLINE_VERSION = c5307dc8fb42b0a18ddf274e71d325b8d652cb16
LIBRETRO_SCUMMVM_MAINLINE_SITE = https://github.com/spleen1981/scummvm-mainline-libretro.git
LIBRETRO_SCUMMVM_MAINLINE_SITE_METHOD=git
LIBRETRO_SCUMMVM_MAINLINE_GIT_SUBMODULES=YES
LIBRETRO_SCUMMVM_MAINLINE_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_SCUMMVM_MAINLINE_LICENSE = GPLv2

define LIBRETRO_SCUMMVM_MAINLINE_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_SCUMMVM_MAINLINE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/scummvm_mainline_libretro.so $(TARGET_DIR)/usr/lib/libretro/scummvm_libretro.so
	cp $(@D)/scummvm_mainline_libretro.info          $(TARGET_DIR)/usr/share/libretro/info/scummvm_libretro.info
endef

$(eval $(generic-package))
