################################################################################
#
# xenia-native
#
################################################################################
# Version: Commits on Jul 27, 2023
XENIA_NATIVE_VERSION = cb38522908a6e2d17f1b23caadd14fcb6cc26cf0
XENIA_NATIVE_SITE = https://github.com/RodoMa92/xenia-canary.git
XENIA_NATIVE_LICENSE = BSD
XENIA_NATIVE_LICENSE_FILE = LICENSE
XENIA_NATIVE_SITE_METHOD=git
XENIA_NATIVE_GIT_SUBMODULES=YES
XENIA_NATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
XENIA_NATIVE_SUBDIR = build

XENIA_NATIVE_DEPENDENCIES = xserver_xorg-server alsa-lib fmt freetype libgtk3 libpng lz4 sdl2 zlib

XENIA_NATIVE_CONF_OPTS += -DCMAKE_C_COMPILER="$(TARGET_CC)"
XENIA_NATIVE_CONF_OPTS += -DCMAKE_CXX_COMPILER="$(TARGET_CXX)"
XENIA_NATIVE_CONF_OPTS += -DCMAKE_AR="$(TARGET_CC)-ar"
XENIA_NATIVE_CONF_OPTS += -DCMAKE_LINKER="$(TARGET_LD)"

define XENIA_CMAKE_FILES
	sed -i "s|pkg-config --|PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig pkg-config --|g" $(@D)/tools/build/scripts/pkg_config.lua
	cd $(@D) && ./xb premake --devenv=cmake
	sed -i "s|/usr/|$(STAGING_DIR)/usr/|g" $(@D)/build/*.cmake
	#cp $(STAGING_DIR)/usr/lib/glib-2.0/include/glibconfig.h $(@D)
endef
XENIA_NATIVE_PRE_CONFIGURE_HOOKS += XENIA_CMAKE_FILES

define XENIA_NATIVE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/build/bin/Linux/Release/xenia $(TARGET_DIR)/usr/bin/xenia-native
endef

$(eval $(cmake-package))
