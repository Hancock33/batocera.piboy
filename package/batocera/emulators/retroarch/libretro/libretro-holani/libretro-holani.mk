################################################################################
#
# libretro-holani
#
################################################################################
# Version: Commits on Dec 20, 2024
LIBRETRO_HOLANI_VERSION = 345d2747dcbab511b83eb4c666ed239f87755545
LIBRETRO_HOLANI_SITE = $(call github,LLeny,holani-retro,$(LIBRETRO_HOLANI_VERSION))
LIBRETRO_HOLANI_LICENSE = GPLv3

define LIBRETRO_HOLANI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libholani.so $(TARGET_DIR)/usr/lib/libretro/holani-libretro.so
endef

$(eval $(cargo-package))
