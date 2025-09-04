################################################################################
#
# jazz2-native
#
################################################################################
# Version: Commits on Sept 03, 2025
JAZZ2_NATIVE_VERSION = d07e71737cae73c0601086f25d0e3a5f925746fb
JAZZ2_NATIVE_SITE =  $(call github,deathkiller,jazz2-native,$(JAZZ2_NATIVE_VERSION))
JAZZ2_NATIVE_LICENSE = GPL-3.0
JAZZ2_NATIVE_LICENSE_FILE = LICENSE

JAZZ2_NATIVE_DEPENDENCIES += sdl2 openal libopenmpt zlib

JAZZ2_NATIVE_SUPPORTS_IN_SOURCE_BUILD = NO

JAZZ2_NATIVE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
JAZZ2_NATIVE_CONF_OPTS += -DNCINE_LINUX_PACKAGE="jazz2"
JAZZ2_NATIVE_CONF_OPTS += -DNCINE_DOWNLOAD_DEPENDENCIES=OFF

ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
    JAZZ2_NATIVE_DEPENDENCIES += libglew libglfw
    JAZZ2_NATIVE_CONF_OPTS += -DNCINE_PREFERRED_BACKEND=GLFW
else
    JAZZ2_NATIVE_CONF_OPTS += -DNCINE_PREFERRED_BACKEND=SDL2
    JAZZ2_NATIVE_CONF_OPTS += -DNCINE_WITH_OPENGLES=ON
endif

$(eval $(cmake-package))
