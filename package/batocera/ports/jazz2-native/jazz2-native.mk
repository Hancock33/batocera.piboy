################################################################################
#
# jazz2-native
#
################################################################################
# Version: Commits on Nov 01, 2024
JAZZ2_NATIVE_VERSION = d3185ca0b409de9e23447b087745ca2dda365aee
JAZZ2_NATIVE_SITE =  $(call github,deathkiller,jazz2-native,$(JAZZ2_NATIVE_VERSION))
JAZZ2_NATIVE_LICENSE = GPL-3.0
JAZZ2_NATIVE_LICENSE_FILE = LICENSE

ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
JAZZ2_NATIVE_DEPENDENCIES += libglew
endif
JAZZ2_NATIVE_DEPENDENCIES += libglfw sdl2 openal libopenmpt zlib

JAZZ2_NATIVE_SUPPORTS_IN_SOURCE_BUILD = NO

JAZZ2_NATIVE_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
JAZZ2_NATIVE_CONF_OPTS += -DNCINE_LINUX_PACKAGE="jazz2"
JAZZ2_NATIVE_CONF_OPTS += -DNCINE_DOWNLOAD_DEPENDENCIES=OFF

define JAZZ2_NATIVE_EVMAPY
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/jazz2-native/jazz2.keys $(TARGET_DIR)/usr/share/evmapy
endef

JAZZ2_NATIVE_POST_INSTALL_TARGET_HOOKS += JAZZ2_NATIVE_EVMAPY

$(eval $(cmake-package))
