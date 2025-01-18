################################################################################
#
# jazz2-native
#
################################################################################
# Version: Commits on Jan 18, 2025
JAZZ2_NATIVE_VERSION = 792d29b20f399c4420cd71ca0929489a9a5b8625
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

define JAZZ2_NATIVE_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/jazz2-native/jazz2.keys $(TARGET_DIR)/usr/share/evmapy
endef

JAZZ2_NATIVE_POST_INSTALL_TARGET_HOOKS += JAZZ2_NATIVE_EVMAPY

$(eval $(cmake-package))
