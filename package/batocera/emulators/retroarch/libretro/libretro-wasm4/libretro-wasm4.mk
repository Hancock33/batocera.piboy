################################################################################
#
# libretro-wasm4
#
################################################################################
# Version: Commits on Jul 29, 2026
LIBRETRO_WASM4_VERSION = f627ffb3b13f90bf8bfac892ab861ecd5f4aa377
LIBRETRO_WASM4_SITE = https://github.com/aduros/wasm4
LIBRETRO_WASM4_SITE_METHOD = git
LIBRETRO_WASM4_GIT_SUBMODULES = yes
LIBRETRO_WASM4_SUPPORTS_IN_SOURCE_BUILD = YES
LIBRETRO_WASM4_SUBDIR = runtimes/native
LIBRETRO_WASM4_LICENSE = ISC
LIBRETRO_WASM4_DEPENDENCIES += retroarch
LIBRETRO_WASM4_EMULATOR_INFO = wasm4.libretro.core.yml

define LIBRETRO_WASM4_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D $(@D)/runtimes/native/wasm4_libretro.so $(TARGET_DIR)/usr/lib/libretro/wasm4_libretro.so
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-wasm4/wasm4.keys $(TARGET_DIR)/usr/share/evmapy/
endef

$(eval $(cmake-package))
$(eval $(emulator-info-package))
