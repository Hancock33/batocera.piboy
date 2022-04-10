################################################################################
#
# LIBRETRO_WASM
#
################################################################################
# Version: Commits on Apr 10, 2022
LIBRETRO_WASM_VERSION = aa3ad64dfa395ab3d14d341ee350235c7731513b
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
