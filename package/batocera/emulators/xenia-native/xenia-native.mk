################################################################################
#
# xenia-native
#
################################################################################
# Version: Commits on Jan 28, 2023
XENIA_NATIVE_VERSION = 4e87d1f9d1ae875d98af62fabdacb75e696e0ba0
XENIA_NATIVE_SITE = https://github.com/xenia-project/xenia.git
XENIA_NATIVE_LICENSE = BSD
XENIA_NATIVE_LICENSE_FILE = LICENSE
XENIA_NATIVE_SITE_METHOD=git
XENIA_NATIVE_GIT_SUBMODULES=YES
XENIA_NATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
XENIA_NATIVE_SUBDIR = build

XENIA_NATIVE_DEPENDENCIES = xserver_xorg-server alsa-lib fmt freetype libgtk3 libpng lz4 sdl2 zlib

#XENIA_NATIVE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
#XENIA_NATIVE_CONF_OPTS += -DCMAKE_VERBOSE_MAKEFILE=ON

define XENIA_CMAKE_FILES
	cd $(@D) && ./xb premake --devenv=cmake
	sed -i "s|/usr/|$(STAGING_DIR)/usr/|g" $(@D)/build/*.cmake
	cp $(STAGING_DIR)/usr/lib/glib-2.0/include/glibconfig.h $(@D)
endef
XENIA_NATIVE_PRE_CONFIGURE_HOOKS += XENIA_CMAKE_FILES

define XENIA_NATIVE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/build/bin/Linux/Debug/xenia $(TARGET_DIR)/usr/bin/xenia-native
	#$(INSTALL) -m 0755 -D $(@D)/build/bin/Linux/Release/xenia $(TARGET_DIR)/usr/bin/xenia-native
endef

$(eval $(cmake-package))
