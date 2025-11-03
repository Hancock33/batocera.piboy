################################################################################
#
# xenia-native
#
################################################################################
# Version: Commits on Nov 03, 2025
XENIA_NATIVE_VERSION = 3252d256ca4b8eabd292a7c8bf66cad5716fece1
XENIA_NATIVE_SITE = https://github.com/xenia-canary/xenia-canary.git
XENIA_NATIVE_LICENSE = BSD
XENIA_NATIVE_LICENSE_FILE = LICENSE
XENIA_NATIVE_SITE_METHOD=git
XENIA_NATIVE_GIT_SUBMODULES=YES
XENIA_NATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
XENIA_NATIVE_SUBDIR = build

XENIA_NATIVE_DEPENDENCIES = xserver_xorg-server alsa-lib fmt freetype libgtk3 libpng lz4 sdl2 zlib
XENIA_NATIVE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99" CXXFLAGS="$(TARGET_CFLAGS) -std=gnu++17"

define XENIA_NATIVE_CROSS_BUILD
	mkdir -p $(@D) && cd $(@D) && \
	PKGCONFIG="$(HOST_DIR)/bin/pkg-config" \
	PKGCONFIG_CONFIG=$(STAGING_DIR)/usr/lib/pkgconfig \
	SYSROOT="$(STAGING_DIR)" \
	SDL2CONFIG="$(STAGING_DIR)/usr/bin/sdl2-config" \
	CC="$(HOST_DIR)/bin/clang" \
	CXX="$(HOST_DIR)/bin/clang++" \
	./xenia-build.py premake --devenv=cmake
endef

XENIA_NATIVE_PRE_CONFIGURE_HOOKS = XENIA_NATIVE_CROSS_BUILD

define XENIA_NATIVE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/build/bin/Linux/Release/xenia_canary $(TARGET_DIR)/usr/bin/xenia-native
endef

$(eval $(cmake-package))
