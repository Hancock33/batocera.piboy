################################################################################
#
# jazz2-native
#
################################################################################
# Version: Commits on Nov 07, 2024
JAZZ2_NATIVE_VERSION = a065da59e9eea5c1c553ab2e89b6947febbae414
JAZZ2_NATIVE_SITE =  $(call github,deathkiller,jazz2-native,$(JAZZ2_NATIVE_VERSION))
JAZZ2_NATIVE_LICENSE = GPL-3.0
JAZZ2_NATIVE_LICENSE_FILE = LICENSE

JAZZ2_NATIVE_DEPENDENCIES += sdl2 openal libopenmpt zlib

JAZZ2_NATIVE_SUPPORTS_IN_SOURCE_BUILD = NO

JAZZ2_NATIVE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
JAZZ2_NATIVE_CONF_OPTS += -DNCINE_LINUX_PACKAGE="jazz2"
JAZZ2_NATIVE_CONF_OPTS += -DNCINE_DOWNLOAD_DEPENDENCIES=OFF

ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
    JAZZ2_NATIVE_DEPENDENCIES += libglew
endif

ifeq ($(BR2_PACKAGE_LIBGLFW),y)
    JAZZ2_NATIVE_DEPENDENCIES += libglfw
    JAZZ2_NATIVE_CONF_OPTS += -DNCINE_PREFERRED_BACKEND=GLFW
else
    JAZZ2_NATIVE_CONF_OPTS += -DNCINE_PREFERRED_BACKEND=SDL2
endif

define JAZZ2_NATIVE_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/jazz2-native/jazz2.keys $(TARGET_DIR)/usr/share/evmapy
endef

JAZZ2_NATIVE_POST_INSTALL_TARGET_HOOKS += JAZZ2_NATIVE_EVMAPY

$(eval $(cmake-package))
