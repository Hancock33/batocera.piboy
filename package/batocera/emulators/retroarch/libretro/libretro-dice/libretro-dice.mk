################################################################################
#
# libretro-dice
#
################################################################################
# Version: Commits on May 02, 2025
LIBRETRO_DICE_VERSION = e3a3e9c6c4a2d881f73fb165a05538467a839a46
LIBRETRO_DICE_SITE = $(call github,mittonk,dice-libretro,$(LIBRETRO_DICE_VERSION))
LIBRETRO_DICE_LICENSE = GPLv3
LIBRETRO_DICE_DEPENDENCIES += retroarch

LIBRETRO_DICE_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_DICE_BUILD_CMDS
	$(SED) "s|\-O[23]|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C \
		$(@D)/ -f Makefile platform="$(LIBRETRO_DICE_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_DICE_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_DICE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/dice_libretro.so $(TARGET_DIR)/usr/lib/libretro/dice_libretro.so
endef

$(eval $(generic-package))
