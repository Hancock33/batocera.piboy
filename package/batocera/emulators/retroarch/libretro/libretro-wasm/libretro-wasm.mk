################################################################################
#
# LIBRETRO_WASM
#
################################################################################
# Version: Commits on Apr 17, 2022
LIBRETRO_WASM_VERSION = ccc307c6c1b6f2801520eb2803c33fa2620b7a40
LIBRETRO_WASM_SITE = https://github.com/aduros/wasm4.git
LIBRETRO_WASM_SITE_METHOD=git
LIBRETRO_WASM_GIT_SUBMODULES=YES

LIBRETRO_WASM_LICENSE = ISC
LIBRETRO_WASM_DEPENDENCIES = retroarch

LIBRETRO_WASM_SUPPORTS_IN_SOURCE_BUILD = NO
LIBRETRO_WASM_SUBDIR = runtimes/native

LIBRETRO_WASM_CONF_OPTS  = -DCMAKE_BUILD_TYPE=Release
LIBRETRO_WASM_CONF_OPTS += -DLIBRETRO=ON

define LIBRETRO_WASM_INSTALL_TARGET_CMDS
    $(INSTALL) -D $(@D)/runtimes/native/buildroot-build/wasm4_libretro.so \
	    $(TARGET_DIR)/usr/lib/libretro/wasm4_libretro.so
endef

$(eval $(cmake-package))
