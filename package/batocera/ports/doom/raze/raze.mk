################################################################################
#
# RAZE
#
################################################################################
# Version: Commits on Apr 16, 2022
RAZE_VERSION = 761502d0b85398431b0b4a94cf06210faeeda855
RAZE_SITE = $(call github,coelckers,Raze,$(RAZE_VERSION))

RAZE_DEPENDENCIES = sdl2 sdl2_mixer host-zmusic zmusic
RAZE_LICENSE = GPL-2.0

RAZE_SUPPORTS_IN_SOURCE_BUILD = NO

RAZE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
RAZE_CONF_OPTS += -DNO_GTK=ON
RAZE_CONF_OPTS += -DFORCE_CROSSCOMPILE=ON
RAZE_CONF_OPTS += -DHAVE_VULKAN=ON
RAZE_CONF_OPTS += -DHAVE_GLES2=ON
RAZE_CONF_OPTS += -DIMPORT_EXECUTABLES=$(HOST_GZDOOM_BUILDDIR)/ImportExecutables.cmake

#define RAZE_KEYS
#	mkdir -p $(TARGET_DIR)/usr/share/evmapy
#	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/doom/raze/prboom.raze.keys $(TARGET_DIR)/usr/share/evmapy
#endef

#RAZE_PRE_INSTALL_TARGET_HOOKS += RAZE_KEYS

$(eval $(cmake-package))
$(eval $(host-cmake-package))
