################################################################################
#
# ATARI800
#
################################################################################
<<<<<<< HEAD
# Version.: Commits on May 29, 2021
=======
# Version.: Commits on Apr 15, 2021
>>>>>>> upstream/master
LIBRETRO_ATARI800_VERSION = b59fb7e92577b734cfdd7b73bfc9821bfab247c2
LIBRETRO_ATARI800_SITE = $(call github,libretro,libretro-atari800,$(LIBRETRO_ATARI800_VERSION))
LIBRETRO_ATARI800_LICENSE = GPL

LIBRETRO_ATARI800_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3),y)
	LIBRETRO_ATARI800_PLATFORM = armv neon
endif

define LIBRETRO_ATARI800_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" GIT_VERSION=" bda947" -C $(@D)/ -f Makefile platform="$(LIBRETRO_ATARI800_PLATFORM)"
endef

define LIBRETRO_ATARI800_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/atari800_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/atari800_libretro.so
endef

$(eval $(generic-package))
