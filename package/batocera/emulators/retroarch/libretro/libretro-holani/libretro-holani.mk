################################################################################
#
# libretro-holani
#
################################################################################
# Version: Commits on Sept 25, 2026
LIBRETRO_HOLANI_VERSION = d0d79b4928e3d32695294142784c033ce7aeda9b
LIBRETRO_HOLANI_SITE = $(call github,LLeny,holani-retro,$(LIBRETRO_HOLANI_VERSION))
LIBRETRO_HOLANI_LICENSE = GPLv3
LIBRETRO_HOLANI_DEPENDENCIES = host-clang host-rustc retroarch
LIBRETRO_HOLANI_EMULATOR_INFO = holani.libretro.core.yml

LIBRETRO_HOLANI_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
LIBRETRO_HOLANI_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(LIBRETRO_HOLANI_CARGO_MODE)

define LIBRETRO_HOLANI_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/$(LIBRETRO_HOLANI_BIN_DIR)/libholani.so	$(TARGET_DIR)/usr/lib/libretro/holani_libretro.so
	$(INSTALL) -D $(@D)/res/holani_libretro.info				$(TARGET_DIR)/usr/share/libretro/info/holani_libretro.info
endef

$(eval $(cargo-package))
$(eval $(emulator-info-package))
