################################################################################
#
# libretro-dice
#
################################################################################
# Version: Commits on Aug 21, 2026
LIBRETRO_DICE_VERSION = b11714fc4eb5b671ba15f2ec7b98c7ae909f7a4c
LIBRETRO_DICE_SITE = $(call github,mittonk,dice-libretro,$(LIBRETRO_DICE_VERSION))
LIBRETRO_DICE_LICENSE = GPLv3
LIBRETRO_DICE_DEPENDENCIES += retroarch
LIBRETRO_DICE_EMULATOR_INFO = dice.libretro.core.yml

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
$(eval $(emulator-info-package))
