################################################################################
#
# libretro-wasm4
#
################################################################################
# Version: Commits on Jan 10, 2024
LIBRETRO_WASM4_VERSION = d321e1243ad07ef855f064f4c4f38f4bc2c49d81
LIBRETRO_WASM4_SITE = https://github.com/aduros/wasm4
LIBRETRO_WASM4_SITE_METHOD = git
LIBRETRO_WASM4_GIT_SUBMODULES = yes
LIBRETRO_WASM4_LICENSE = ISC
LIBRETRO_WASM4_SUPPORTS_IN_SOURCE_BUILD = YES
LIBRETRO_WASM4_SUBDIR = runtimes/native

LIBRETRO_WASM4_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
LIBRETRO_WASM4_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define LIBRETRO_WASM4_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/evmap
	$(INSTALL) -D $(@D)/runtimes/native/wasm4_libretro.so $(TARGET_DIR)/usr/lib/libretro/wasm4_libretro.so
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-wasm4/wasm4.keys $(TARGET_DIR)/usr/share/evmapy/
endef

$(eval $(cmake-package))
