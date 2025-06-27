################################################################################
#
# libretro-holani
#
################################################################################
# Version: Commits on Dec 31, 2024
LIBRETRO_HOLANI_VERSION = 61114880081cc518b54c898708ad1d162d9077ec
LIBRETRO_HOLANI_SITE = $(call github,LLeny,holani-retro,$(LIBRETRO_HOLANI_VERSION))
LIBRETRO_HOLANI_LICENSE = GPLv3
LIBRETRO_HOLANI_DEPENDENCIES = host-rustc host-rust-bin host-clang retroarch

LIBRETRO_HOLANI_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
LIBRETRO_HOLANI_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(LIBRETRO_HOLANI_CARGO_MODE)

# Temporary fix for 'stddef.h file not found'
# https://github.com/batocera-linux/batocera.linux/issues/13393
LIBRETRO_HOLANI_CARGO_ENV = BINDGEN_EXTRA_CLANG_ARGS="-I$(HOST_DIR)/lib/clang/$(CLANG_VERSION_MAJOR)/include/"

define LIBRETRO_HOLANI_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/$(LIBRETRO_HOLANI_BIN_DIR)/libholani.so	$(TARGET_DIR)/usr/lib/libretro/holani_libretro.so
	$(INSTALL) -D $(@D)/res/holani_libretro.info				$(TARGET_DIR)/usr/share/libretro/info/holani_libretro.info
endef

$(eval $(cargo-package))
