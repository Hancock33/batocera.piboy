################################################################################
#
# jazz2-native
#
################################################################################
# Version: Commits on Nov 22, 2026
JAZZ2_NATIVE_VERSION = 09e2a171005cc33143f14a000677a85d5746b7aa
JAZZ2_NATIVE_SITE = $(call github,deathkiller,jazz2-native,$(JAZZ2_NATIVE_VERSION))
JAZZ2_NATIVE_LICENSE = GPL-3.0
JAZZ2_NATIVE_LICENSE_FILES = LICENSE
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
    JAZZ2_NATIVE_CONF_OPTS += -DNCINE_RHI_GL_PROFILE=ES3
endif

$(eval $(cmake-package))
$(eval $(emulator-info-package))
