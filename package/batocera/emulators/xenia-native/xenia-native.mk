################################################################################
#
# xenia-native
#
################################################################################
# Version: Commits on Jan 22, 2025
XENIA_NATIVE_VERSION = 403c9500bbced75cba5c6b3a1660ef655704513a
XENIA_NATIVE_SITE = https://github.com/xenia-canary/xenia-canary.git
XENIA_NATIVE_LICENSE = BSD
XENIA_NATIVE_LICENSE_FILE = LICENSE
XENIA_NATIVE_SITE_METHOD=git
XENIA_NATIVE_GIT_SUBMODULES=YES
XENIA_NATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
XENIA_NATIVE_SUBDIR = build

XENIA_NATIVE_DEPENDENCIES = xserver_xorg-server alsa-lib fmt freetype libgtk3 libpng lz4 sdl2 zlib

define XENIA_CMAKE_FILES
	sed -i "s|pkg-config --|PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig pkg-config --|g" $(@D)/tools/build/scripts/pkg_config.lua
	cd $(@D) && ./xb premake --devenv=cmake
	sed -i "s|/usr/|$(STAGING_DIR)/usr/|g" $(@D)/build/*.cmake
endef
XENIA_NATIVE_PRE_CONFIGURE_HOOKS += XENIA_CMAKE_FILES

define XENIA_NATIVE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/build/bin/Linux/Release/xenia_canary $(TARGET_DIR)/usr/bin/xenia-native
endef

$(eval $(cmake-package))
