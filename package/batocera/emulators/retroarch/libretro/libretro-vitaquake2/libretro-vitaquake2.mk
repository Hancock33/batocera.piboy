################################################################################
#
# libretro-vitaquake2
#
################################################################################
# Version: Commits on May 22, 2022
LIBRETRO_VITAQUAKE2_VERSION = ca814acd5fef056391ed89aad09b6ec1ec83be95
LIBRETRO_VITAQUAKE2_SITE = $(call github,libretro,vitaquake2,$(LIBRETRO_VITAQUAKE2_VERSION))
LIBRETRO_VITAQUAKE2_LICENSE = GPL-2.0

LIBRETRO_VITAQUAKE2_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI4),y)
LIBRETRO_VITAQUAKE2_PLATFORM=rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3)$(BR2_PACKAGE_BATOCERA_TARGET_RPIZERO2),y)
    ifeq ($(BR2_arm),y)
        LIBRETRO_VITAQUAKE2_PLATFORM=rpi3
    else
        LIBRETRO_VITAQUAKE2_PLATFORM=rpi3_64
    endif
endif

define LIBRETRO_VITAQUAKE2_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_VITAQUAKE2_PLATFORM)"
endef

define LIBRETRO_VITAQUAKE2_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/vitaquake2_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/vitaquake2_libretro.so
endef

$(eval $(generic-package))
