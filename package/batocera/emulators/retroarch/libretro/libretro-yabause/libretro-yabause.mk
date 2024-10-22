################################################################################
#
# libretro-yabause
#
################################################################################
# Version: Commits on Oct 21, 2024
LIBRETRO_YABAUSE_VERSION = c35712c5ed33e18d77097f2059a036e19d1d66f2
LIBRETRO_YABAUSE_SITE = $(call github,libretro,yabause,$(LIBRETRO_YABAUSE_VERSION))
LIBRETRO_YABAUSE_LICENSE = GPL

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
    LIBRETRO_YABAUSE_EXTRA_ARGS = ARCH=aarch64
    LIBRETRO_YABAUSE_PLATFORM = rpi4_64
else
    LIBRETRO_YABAUSE_PLATFORM = $(LIBRETRO_PLATFORM)
    LIBRETRO_YABAUSE_EXTRA_ARGS =
endif

define LIBRETRO_YABAUSE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/yabause/src/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(LIBRETRO_YABAUSE_TARGET_LDFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
		-C $(@D)/yabause/src/libretro -f Makefile \
		platform="$(LIBRETRO_YABAUSE_PLATFORM)" $(LIBRETRO_YABAUSE_EXTRA_ARGS)
endef

define LIBRETRO_YABAUSE_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/yabause/src/libretro/yabause_libretro.so $(TARGET_DIR)/usr/lib/libretro/yabause_libretro.so
endef

$(eval $(generic-package))
