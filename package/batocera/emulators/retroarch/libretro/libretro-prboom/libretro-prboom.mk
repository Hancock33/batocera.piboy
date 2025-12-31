################################################################################
#
# libretro-prboom
#
################################################################################
# Version: Commits on Dec 13, 2025
LIBRETRO_PRBOOM_VERSION = 93c8e7a2074e4fd8410398e3d571c6d9afec1d84
LIBRETRO_PRBOOM_SITE = $(call github,libretro,libretro-prboom,$(LIBRETRO_PRBOOM_VERSION))
LIBRETRO_PRBOOM_LICENSE = GPLv2
LIBRETRO_PRBOOM_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
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
