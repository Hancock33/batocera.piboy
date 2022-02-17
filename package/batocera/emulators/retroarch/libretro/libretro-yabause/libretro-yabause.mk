################################################################################
#
# YABAUSE
#
################################################################################
# Version.: Commits on Feb 17, 2022
LIBRETRO_YABAUSE_VERSION = f955577b324ac27ec572019e6c02a91c10d79d3c
LIBRETRO_YABAUSE_SITE = $(call github,libretro,yabause,$(LIBRETRO_YABAUSE_VERSION))
LIBRETRO_YABAUSE_LICENSE = GPL

LIBRETRO_YABAUSE_EXTRA_ARGS=
LIBRETRO_YABAUSE_BOARD=

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_YABAUSE_EXTRA_ARGS=ARCH=aarch64
LIBRETRO_YABAUSE_PLATFORM=rpi4_64
else
LIBRETRO_YABAUSE_PLATFORM=$(LIBRETRO_PLATFORM)
endif

define LIBRETRO_YABAUSE_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(LIBRETRO_YABAUSE_TARGET_LDFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		-C $(@D)/yabause/src/libretro -f Makefile \
		platform="$(LIBRETRO_YABAUSE_PLATFORM)" $(LIBRETRO_YABAUSE_EXTRA_ARGS)
endef

define LIBRETRO_YABAUSE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/yabause/src/libretro/yabause_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/yabause_libretro.so
endef

$(eval $(generic-package))
