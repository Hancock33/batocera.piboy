################################################################################
#
# libretro-wasm4
#
################################################################################
# Version: Commits on Aug 04, 2025
LIBRETRO_WASM4_VERSION = 0f04103768ad52bd8915a4c0a839249443d00036
LIBRETRO_WASM4_SITE = https://github.com/aduros/wasm4
LIBRETRO_WASM4_SITE_METHOD = git
LIBRETRO_WASM4_GIT_SUBMODULES = yes
LIBRETRO_WASM4_SUPPORTS_IN_SOURCE_BUILD = YES
LIBRETRO_WASM4_SUBDIR = runtimes/native
LIBRETRO_WASM4_LICENSE = ISC
LIBRETRO_WASM4_DEPENDENCIES = retroarch

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_X86_64_ANY),y)
    LIBRETRO_WASM4_DEPENDENCIES += libglvnd
    LIBRETRO_WASM4_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
    LIBRETRO_WASM4_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++
endif

define LIBRETRO_WASM4_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	$(INSTALL) -D $(@D)/runtimes/native/wasm4_libretro.so $(TARGET_DIR)/usr/lib/libretro/wasm4_libretro.so
	cp -f $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-wasm4/wasm4.keys $(TARGET_DIR)/usr/share/evmapy/
endef

$(eval $(cmake-package))
