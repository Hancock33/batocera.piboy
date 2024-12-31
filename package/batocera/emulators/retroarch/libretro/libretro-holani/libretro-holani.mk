################################################################################
#
# libretro-holani
#
################################################################################
# Version: Commits on Dec 31, 2024
LIBRETRO_HOLANI_VERSION = 61114880081cc518b54c898708ad1d162d9077ec
LIBRETRO_HOLANI_SITE = $(call github,LLeny,holani-retro,$(LIBRETRO_HOLANI_VERSION))
LIBRETRO_HOLANI_LICENSE = GPLv3

define LIBRETRO_HOLANI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libholani.so $(TARGET_DIR)/usr/lib/libretro/holani-libretro.so
endef

$(eval $(cargo-package))
