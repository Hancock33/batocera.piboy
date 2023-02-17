################################################################################
#
# libretro-citra
#
################################################################################
# Version: Commits on Feb 17, 2023
LIBRETRO_CITRA_VERSION = d7e1612c17b1acb5d5eb68bb046820db49aeea5e
LIBRETRO_CITRA_SITE = https://github.com/libretro/citra.git
LIBRETRO_CITRA_SITE_METHOD=git
LIBRETRO_CITRA_GIT_SUBMODULES=YES
LIBRETRO_CITRA_DEPENDENCIES = boost
LIBRETRO_CITRA_LICENSE = GPLv2+

define LIBRETRO_CITRA_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix" HAVE_FFMPEG_STATIC=0
endef

define LIBRETRO_CITRA_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/citra_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/citra_libretro.so
endef

$(eval $(generic-package))
