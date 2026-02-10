################################################################################
#
# xenia-native
#
################################################################################
# Version: Commits on Jan 31, 2026
XENIA_NATIVE_VERSION = 8f5da619f99fc66adc01c060b6b491939abae9d0
XENIA_NATIVE_SITE = https://github.com/xenia-canary/xenia-canary.git
XENIA_NATIVE_LICENSE = BSD
XENIA_NATIVE_LICENSE_FILE = LICENSE
XENIA_NATIVE_SITE_METHOD=git
XENIA_NATIVE_GIT_SUBMODULES=YES
XENIA_NATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
XENIA_NATIVE_SUBDIR = build

XENIA_NATIVE_DEPENDENCIES = xserver_xorg-server alsa-lib fmt freetype libgtk3 libpng lz4 sdl2 zlib

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
	$(TARGET_STRIP) $(@D)/build/bin/Linux/Release/xenia_canary
	$(INSTALL) -m 0755 -D $(@D)/build/bin/Linux/Release/xenia_canary $(TARGET_DIR)/usr/bin/xenia-native
endef

$(eval $(cmake-package))
