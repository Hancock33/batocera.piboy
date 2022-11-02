################################################################################
#
# libretro-wasm4
#
################################################################################
# Version: Commits on Nov 02, 2022
LIBRETRO_WASM4_VERSION = 800709e8ab5e3c03910bc5be4ca7d8b07e5c298d
LIBRETRO_WASM4_SITE = https://github.com/aduros/wasm4
LIBRETRO_WASM4_SITE_METHOD = git
LIBRETRO_WASM4_GIT_SUBMODULES = yes
LIBRETRO_WASM4_LICENSE = ISC
LIBRETRO_WASM4_SUPPORTS_IN_SOURCE_BUILD = YES
LIBRETRO_WASM4_SUBDIR = runtimes/native
LIBRETRO_WASM4_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
LIBRETRO_WASM4_PLATFORM = $(LIBRETRO_PLATFORM)

define LIBRETRO_WASM4_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/runtimes/native/wasm4_libretro.so $(TARGET_DIR)/usr/lib/libretro/wasm4_libretro.so
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-wasm4/wasm4.keys $(TARGET_DIR)/usr/share/evmapy/
endef

$(eval $(cmake-package))
