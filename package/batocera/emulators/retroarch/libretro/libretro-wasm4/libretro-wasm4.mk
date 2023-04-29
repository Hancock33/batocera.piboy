################################################################################
#
# libretro-wasm4
#
################################################################################
# Version: Commits on Apr 28, 2023
LIBRETRO_WASM4_VERSION = 069daad6eb081e6556bedf6a23b8a90fcf153ab1
LIBRETRO_WASM4_SITE = https://github.com/aduros/wasm4
LIBRETRO_WASM4_SITE_METHOD = git
LIBRETRO_WASM4_GIT_SUBMODULES = yes
LIBRETRO_WASM4_LICENSE = ISC
LIBRETRO_WASM4_SUPPORTS_IN_SOURCE_BUILD = YES
LIBRETRO_WASM4_SUBDIR = runtimes/native
LIBRETRO_WASM4_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release -GNinja

define LIBRETRO_WASM4_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(LIBRETRO_WASM4_BUILDDIR)
endef

define LIBRETRO_WASM4_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/runtimes/native/wasm4_libretro.so $(TARGET_DIR)/usr/lib/libretro/wasm4_libretro.so
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-wasm4/wasm4.keys $(TARGET_DIR)/usr/share/evmapy/
endef

$(eval $(cmake-package))
