################################################################################
#
# libretro-citra
#
################################################################################
# Version: Commits on Nov 29, 2022
LIBRETRO_CITRA_VERSION = aa165606f1e2d74e0edb9b25b20f1f566aa91e35
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
