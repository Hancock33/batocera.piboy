################################################################################
#
# libretro-prboom
#
################################################################################
# Version: Commits on Dec 27, 2024
LIBRETRO_PRBOOM_VERSION = b3e5f8b2e8855f9c6fc7ff7a0036e4e61379177d
LIBRETRO_PRBOOM_SITE = $(call github,libretro,libretro-prboom,$(LIBRETRO_PRBOOM_VERSION))
LIBRETRO_PRBOOM_LICENSE = GPLv2

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
    LIBRETRO_PRBOOM_PLATFORM = armv
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
    LIBRETRO_PRBOOM_PLATFORM = armv neon
else ifeq ($(BR2_aarch64),y)
    LIBRETRO_PRBOOM_PLATFORM = unix
else
    LIBRETRO_PRBOOM_PLATFORM = $(LIBRETRO_PLATFORM)
endif

define LIBRETRO_PRBOOM_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_PRBOOM_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_PRBOOM_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_PRBOOM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/prboom_libretro.so $(TARGET_DIR)/usr/lib/libretro/prboom_libretro.so
endef

$(eval $(generic-package))
