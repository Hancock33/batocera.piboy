################################################################################
#
# libretro-flycast2021
#
################################################################################
# Version: Commits on Apr 06, 2022
LIBRETRO_FLYCAST2021_VERSION = 4c293f306bc16a265c2d768af5d0cea138426054
LIBRETRO_FLYCAST2021_SITE = $(call github,libretro,flycast,$(LIBRETRO_FLYCAST2021_VERSION))
LIBRETRO_FLYCAST2021_LICENSE = GPLv2
LIBRETRO_FLYCAST2021_DEPENDENCIES = retroarch

LIBRETRO_FLYCAST2021_PLATFORM = $(LIBRETRO_PLATFORM)
LIBRETRO_FLYCAST2021_EXTRA_ARGS = HAVE_OPENMP=1

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_FLYCAST2021_PLATFORM = rpi4_64
LIBRETRO_FLYCAST2021_EXTRA_ARGS += FORCE_GLES=1 HAVE_VULKAN=1 ARCH=arm64 LDFLAGS=-lrt
endif

define LIBRETRO_FLYCAST2021_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile \
		platform="$(LIBRETRO_FLYCAST2021_PLATFORM)" $(LIBRETRO_FLYCAST2021_EXTRA_ARGS) \
        GIT_VERSION="-$(shell echo $(LIBRETRO_FLYCAST2021_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_FLYCAST2021_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/flycast_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/flycast2021_libretro.so
endef

$(eval $(generic-package))
