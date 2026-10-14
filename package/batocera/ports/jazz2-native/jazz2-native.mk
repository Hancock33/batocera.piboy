################################################################################
#
# jazz2-native
#
################################################################################
# Version: Commits on Oct 14, 2026
JAZZ2_NATIVE_VERSION = c197be09c6fea8e3294bfade55b31f00bedc2e8e
JAZZ2_NATIVE_SITE =  $(call github,deathkiller,jazz2-native,$(JAZZ2_NATIVE_VERSION))
JAZZ2_NATIVE_LICENSE = GPL-3.0
JAZZ2_NATIVE_LICENSE_FILE = LICENSE
JAZZ2_NATIVE_EMULATOR_INFO = jazz2-native.emulator.yml

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
$(eval $(emulator-info-package))
